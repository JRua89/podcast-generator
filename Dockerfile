FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Upgrade pip and related tools for the current user
RUN python3 -m pip install --upgrade --user pip setuptools wheel

# Now, install the Python package for the current user
RUN python3 -m pip install --user PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]