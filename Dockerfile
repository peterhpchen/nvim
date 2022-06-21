FROM greyltc/archlinux-aur:yay-20220612.0.220

ARG NODE_VERSION="16.15.1"

ENV XDG_CONFIG_HOME="/root/.config"
ENV SHELL="/bin/bash"

RUN pacman -Sy
RUN yay -Sy

# RUN apk add --no-cache zsh


RUN pacman -S --noconfirm unzip=6.0-18
# RUN apk add --no-cache build-base curl

RUN pacman -S --noconfirm git=2.36.1-1

#RUN apk add --no-cache mandoc man-pages

#RUN apk add --no-cache rlwrap https://cht.sh/:cht.sh | tee /usr/local/bin/cht.sh && chmod +x /usr/local/bin/cht.sh

COPY /bash/.bashrc /root/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION
ENV PATH $XDG_CONFIG_HOME/nvm/versions/node/v$NODE_VERSION/bin:$PATH

RUN sudo -u ab -D~ bash -c 'yay -S --noconfirm hadolint-bin=2.10.0-1'

RUN pacman -S --noconfirm neovim=0.7.0-3
COPY /nvim /root/.config/nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless -c 'TSInstallSync lua dockerfile' -c 'q'
RUN nvim --headless -c 'LspInstall --sync sumneko_lua dockerls' -c 'q'

WORKDIR /root/workspace
ENTRYPOINT nvim
