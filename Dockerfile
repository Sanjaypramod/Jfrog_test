# Stage 1: Install dependencies
FROM python:3.10-slim AS builder

# Set environment variables for JFrog credentials
ARG JFROG_REPO_URL
ARG JFROG_USERNAME
ARG JFROG_PASSWORD

# Install tools required to add JFrog credentials and package requirements
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Create a pip.conf file with JFrog credentials
RUN mkdir -p /root/.pip && \
    echo "[global]" > /root/.pip/pip.conf && \
    echo "index-url = https://${JFROG_USERNAME}:${JFROG_PASSWORD}@${JFROG_REPO_URL}/simple" >> /root/.pip/pip.conf

# Copy requirements file
COPY requirements.txt .

# Install dependencies from JFrog repository
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Build the final image
FROM python:3.10-slim

# Copy installed packages from the builder stage to keep the final image minimal
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Install Apache2 for demo
RUN apt update -y && \
    apt install -y apache2 apache2-utils 

# Custom Index file
COPY index.html /var/www/html

# Copy application code
COPY . /app
WORKDIR /app

# Expose Port
EXPOSE 80

# Start the apache process
CMD ["apache2ctl", "-D", "FOREGROUND"]
