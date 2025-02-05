FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    build-essential \
    python3-dev \
    libyaml-dev

# Install Python packages
RUN pip3 install --no-cache-dir PyYAML

# Copy Python script
COPY feed.py /usr/bin/feed.py

# Copy entrypoint script and set executable permission
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
