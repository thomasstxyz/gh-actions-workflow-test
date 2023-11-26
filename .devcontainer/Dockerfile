FROM mcr.microsoft.com/devcontainers/base:jammy

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
    bash-completion \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl --output /usr/local/share/task.bash "https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash" \
    && chmod +x /usr/local/share/task.bash \
    && echo 'source /usr/local/share/task.bash' >> /home/vscode/.bashrc

USER vscode
