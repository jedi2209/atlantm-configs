# Project Overview

This repository contains configuration files and scripts for managing a cloud-based infrastructure. It includes support for services like AWS, MySQL, Nginx, PHP-FPM, and more.

## Directory Structure

- **.aws/**: Contains AWS credentials and related configurations.
- **certbot/**: Configuration for managing SSL certificates using Certbot.
- **cloudbeaver/**: Configuration for CloudBeaver, a web-based database management tool.
- **composer/**: Composer-related scripts and configurations.
- **mysql/**: MySQL configuration files.
- **nginx/**: Nginx configuration files, including virtual host settings.
- **php-fpm7.3/**, **php-fpm7.4/**, **php-fpm8.2/**: PHP-FPM configurations for different PHP versions.
- **rclone/**: Configuration for Rclone.
- **sftp/**: SFTP server configuration.
- **vsftpd/**: Configuration for the VSFTPD FTP server.

## Key Files

- **.env**: Environment variables for the project.
- **docker-compose.yml**: Docker Compose configuration for managing containers.
- **init.sh**: Initialization script for setting up the environment.
- **logrotate.conf**: Configuration for log rotation.
- **cloud-config.yml**: Cloud-init configuration for provisioning cloud instances.

## Usage

1. **Setup Environment**: Configure the `.env` file with your environment-specific variables.
2. **Start Services**: Use `docker-compose` to start the services:
   ```sh
   docker-compose up -d
   ```
3. **Manage Certificates**: Use the `certbot/` directory for SSL certificate management.
4. **Customize Configurations**: Modify configuration files in the respective directories (e.g., `nginx/`, `mysql/`, `php-fpm7.3/`) as needed.

## Notes

- Ensure that sensitive files like `.aws/credentials` and `.env` are not exposed publicly.
- Refer to individual service documentation for advanced configuration options.

## License

This project is licensed under CC-BY-NC-4.0.
