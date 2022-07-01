FROM greyltc/archlinux-aur:yay

ARG NODE_VERSION="16.15.1"

ENV XDG_CONFIG_HOME="/root/.config"
ENV SHELL="/bin/bash"

RUN pacman -Sy
RUN yay -Sy

# RUN apk add --no-cache zsh


RUN pacman -S --noconfirm --quiet unzip ripgrep fd

RUN pacman -S --noconfirm --quiet git

#RUN apk add --no-cache mandoc man-pages

#RUN apk add --no-cache rlwrap https://cht.sh/:cht.sh | tee /usr/local/bin/cht.sh && chmod +x /usr/local/bin/cht.sh

COPY /xdg-config-home $XDG_CONFIG_HOME

RUN touch /root/.bashrc

# Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION
ENV PATH="$XDG_CONFIG_HOME/nvm/versions/node/v$NODE_VERSION/bin:$PATH"
COPY /eslint /root
RUN npm install eslint --global

# # Rust
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
# RUN echo 'source $HOME/.cargo/env' >> /root/.bashrc
# ENV PATH=/root/.cargo/bin:$PATH

# Dockerfile
RUN sudo -u ab -D~ bash -c 'yay -S --noconfirm --quiet hadolint-bin'

# Lua
RUN pacman -S --noconfirm --quiet stylua

# Shell
RUN pacman -S --noconfirm --quiet shellcheck
RUN pacman -S --noconfirm --quiet shfmt

# Neovim
RUN pacman -S --noconfirm --quiet neovim
RUN sudo -u ab -D~ bash -c 'yay -S --noconfirm --quiet nvim-packer-git'
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless -c 'TSInstallSync lua dockerfile bash json javascript' -c 'q'
RUN nvim --headless -c 'LspInstall --sync sumneko_lua dockerls bashls jsonls eslint' -c 'q'

WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash", "-l", "-c"]
CMD ["nvim"]
