# DevOps Symfony

A Symfony-based DevOps playground project demonstrating containerization, CI/CD workflows, and modern deployment practices.

## Overview

This repository serves as a practical example of deploying a Symfony application using Docker, GitHub Actions, and cloud deployment platforms. Starting template for Symfony projects with production-ready infrastructure.

## Features

- **Dockerized Environment**: Fully containerized Symfony application with Docker and Docker Compose
- **CI/CD Pipeline**: Automated workflows using GitHub Actions
- **Cloud Deployment**: Configured for deployment to Fly.io
- **Development Ready**: Pre-configured environment files and editor settings

## Project Structure

- `.github/workflows/` - GitHub Actions CI/CD pipeline configurations
- `bin/` - Symfony console and executable scripts
- `config/` - Application configuration files
- `docker/` - Docker-related configuration files
- `public/` - Web server document root
- `src/` - Application source code
- `Dockerfile` - Container image definition
- `docker-compose.yml` - Multi-container orchestration
- `fly.toml` - Fly.io deployment configuration

## Prerequisites

- Docker and Docker Compose
- PHP 8.0 or higher
- Composer
- Git

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/WookieWil/devops-symfony.git
cd devops-symfony
```

### 2. Environment Setup

Copy the development environment file:

```bash
cp .env.dev .env
```

Edit `.env` to configure your local environment variables as needed.

### 3. Install Dependencies

```bash
docker-compose exec app composer install
```

### 4. Build and Run locally via Docker

```bash
docker build -t symfony-app .

docker run -d -p 8080:8080 --name symfony-app symfony-app
```

The application should now be running and accessible at `http://localhost:8000` (or the port specified in your docker-compose.yml).

Check `http://localhost:8000/health` for health check response.

## Development

### Running Symfony Commands

Execute Symfony console commands inside the container:

```bash
docker-compose exec app bin/console [command]
```

### Viewing Logs

```bash
docker-compose logs -f app
```

### Stopping the Application

```bash
docker-compose down
```

## Deployment

This project is configured for deployment to Fly.io. The `fly.toml` file contains the deployment configuration.

### Deploy to Fly.io

1. Install the Fly CLI
2. Authenticate with `fly auth login`
3. Deploy with `fly deploy`

## CI/CD

GitHub Actions workflows are configured in `.github/workflows/` to automate:

- Code quality checks
- Automated testing
- Container image building
- Deployment pipelines

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available for educational and development purposes.

## Acknowledgments

Built with Symfony framework and modern DevOps tooling for demonstration and learning purposes.
