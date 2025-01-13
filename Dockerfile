FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git && \
    apt-get clean

# Install Python package dependencies
RUN pip3 install pyyaml

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the container
COPY feed.py ./feed.py
COPY entrypoint.sh ./entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x ./entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["./entrypoint.sh"]
