# Start from the official Ubuntu base image
FROM ubuntu:latest

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY . /var/www/html

# Expose port 80 (default Apache port)
EXPOSE 80

# Start Apache in the foreground when the container starts
CMD ["apachectl", "-D", "FOREGROUND"]
