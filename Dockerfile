FROM ubuntu:latest

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip separately
RUN python3 -m pip install --upgrade pip

# Install PyYAML separately
RUN pip3 install --no-cache-dir PyYAML

# Copy the feed.py script to the appropriate location
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
