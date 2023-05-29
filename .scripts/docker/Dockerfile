FROM greyltc/archlinux-aur:yay

ARG NODE_VERSION="16.15.1"
ARG PYTHON_VERSION="3.10.5"

ENV XDG_CONFIG_HOME="/root/.config"
ENV SHELL="/bin/bash"

RUN pacman -Sy
RUN yay -Sy


RUN pacman -S --noconfirm --quiet unzip ripgrep fd

RUN pacman -S --noconfirm --quiet git

RUN touch /root/.bashrc
RUN touch /root/.bash_profile

# Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION
ENV PATH="$XDG_CONFIG_HOME/nvm/versions/node/v$NODE_VERSION/bin:$PATH"

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> /root/.bashrc
ENV PATH=/root/.cargo/bin:$PATH

# Python
RUN curl https://pyenv.run | bash

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bashrc
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> /root/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bash_profile
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> /root/.bash_profile
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> /root/.bash_profile

RUN source /root/.bashrc && pyenv install $PYTHON_VERSION && pyenv global "$PYTHON_VERSION"

# Neovim
RUN pacman -S --noconfirm --quiet neovim
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/peterhpchen/nvim/main/.scripts/install.sh)"

WORKDIR /root/workspace
ENTRYPOINT ["/bin/bash", "-l", "-c"]
CMD ["nvim"]
