FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a non-root user for security
RUN useradd -m appuser

# Set working directory
WORKDIR /home/appuser

# Create and activate a virtual environment
RUN python3 -m venv venv
ENV PATH="/home/appuser/venv/bin:$PATH"

# Now, install the Python package inside the virtual environment
RUN pip install PyYAML

# Copy application files
COPY --chown=appuser:appuser feed.py ./feed.py
COPY --chown=appuser:appuser entrypoint.sh ./entrypoint.sh

# Set the user to run the container
USER appuser

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]