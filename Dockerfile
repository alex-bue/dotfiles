FROM ubuntu:22.04

ENV TIMEZONE "Europe/Copenhagen"
ENV DEBIAN_FRONTEND=noninteractive

# Setup time zones.
RUN ln -snf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

ENV DOCKERIZED true

# Configure dotfiles or other setup tasks.
COPY ./scripts/setup.sh /tmp/setup.sh
RUN /tmp/setup.sh --all

# Start zsh shell.
CMD ["zsh", "-l"]

