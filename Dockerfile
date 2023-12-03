FROM ubuntu:20.04

ENV TIMEZONE "Europe/Copenhagen"
ENV DEBIAN_FRONTEND=noninteractive

# Setup time zones.
RUN ln -snf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime && \
    echo $TIMEZONE > /etc/timezone

ENV DOCKERIZED true

# Install necessities
RUN apt-get update && apt-get install -y sudo software-properties-common git curl wget

# Create a new user 'user' and add to sudo group.
RUN useradd -m user && \
    echo "user:user" | chpasswd && \
    adduser user sudo
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user
WORKDIR /home/user

# Configure dotfiles or other setup tasks.
COPY ./scripts/setup.sh /tmp/setup.sh
RUN /tmp/setup.sh --all

# Reset the frontend to its original state.
ENV DEBIAN_FRONTEND=

# Start zsh shell.
CMD ["zsh", "-l"]

