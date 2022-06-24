FROM greyltc/archlinux-aur:yay-20220619.0.221

ARG NODE_VERSION="16.15.1"

ENV XDG_CONFIG_HOME="/root/.config"
ENV SHELL="/bin/bash"

RUN pacman -Sy
RUN yay -Sy

# RUN apk add --no-cache zsh


RUN pacman -S --noconfirm unzip=6.0-18 ripgrep=13.0.0-2 fd=8.4.0-1

RUN pacman -S --noconfirm git=2.36.1-1

#RUN apk add --no-cache mandoc man-pages

#RUN apk add --no-cache rlwrap https://cht.sh/:cht.sh | tee /usr/local/bin/cht.sh && chmod +x /usr/local/bin/cht.sh

COPY /xdg-config-home $XDG_CONFIG_HOME

COPY /bash/.bashrc /root/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION
ENV PATH $XDG_CONFIG_HOME/nvm/versions/node/v$NODE_VERSION/bin:$PATH

# Dockerfile
RUN sudo -u ab -D~ bash -c 'yay -S --noconfirm hadolint-bin=2.10.0-1'

# Lua
RUN pacman -S --noconfirm stylua=0.13.1-1

# Shell
RUN pacman -S --noconfirm shellcheck=0.8.0-127
RUN pacman -S --noconfirm shfmt=3.5.1-1

# Neovim
RUN pacman -S --noconfirm neovim=0.7.0-3
RUN sudo -u ab -D~ bash -c 'yay -S --noconfirm nvim-packer-git=r498.00ec5ad-1'
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless -c 'TSInstallSync lua dockerfile vue bash' -c 'q'
RUN nvim --headless -c 'LspInstall --sync sumneko_lua dockerls volar bashls' -c 'q'

WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash"]
# CMD ["nvim"]
