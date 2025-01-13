FROM ubuntu:latest

# Ensure non-interactive frontend for apt-get to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-distutils \
    python3-setuptools \
    build-essential \
    git && \
    apt-get clean

# Install Python package dependencies
RUN pip3 install --no-cache-dir pyyaml

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the container
COPY feed.py ./feed.py
COPY entrypoint.sh ./entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x ./entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["./entrypoint.sh"]
