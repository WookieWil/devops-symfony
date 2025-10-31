# DevOps Symfony

> A Symfony-based DevOps playground demonstrating containerization, CI/CD workflows, and modern deployment practices.

## Overview

This repository is a production-ready Symfony application template showcasing modern DevOps practices including:
- Docker containerization
- GitHub Actions CI/CD pipelines
- Cloud deployment with Fly.io

Perfect for learning DevOps or jumpstarting your next Symfony project.

---

## Features

- **Dockerized Environment** - Fully containerized with Docker & Docker Compose
- **CI/CD Pipeline** - Automated workflows via GitHub Actions
- **Cloud Ready** - Pre-configured for Fly.io deployment
- **Development Ready** - Pre-configured environment files and editor settings

---

## Project Structure

```
devops-symfony/
├── .github/workflows/      # CI/CD pipeline configurations
├── bin/                    # Symfony console & executable scripts
├── config/                 # Application configuration
├── docker/                 # Docker configuration files
├── public/                 # Web server document root
├── src/                    # Application source code
├── Dockerfile              # Container image definition
├── docker-compose.yml      # Multi-container orchestration
└── fly.toml                # Fly.io deployment config
```

---

## Quick Start

### Prerequisites

Before starting, ensure you have:
- **Docker** and **Docker Compose** installed
- **PHP 8.0+** (for local development)
- **Composer** (PHP dependency manager)
- **Git**

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/WookieWil/devops-symfony.git
cd devops-symfony
```

**2. Set up environment variables**
```bash
cp .env.dev .env
```
Edit `.env` to configure your local settings.

**3. Build and run with Docker**

**Option A: Using Docker Compose (Recommended for development)**
```bash
docker-compose up -d
docker-compose exec app composer install
```

**Option B: Using Docker CLI**
```bash
docker build -t symfony-app .
docker run -d -p 8080:8080 --name symfony-app symfony-app
```

**4. Access the application**
- Main app: http://localhost:8080
- Health check: http://localhost:8080/health

---

## ðŸ› ï¸  Development

### Running Symfony Commands

Execute Symfony console commands inside the container:
```bash
docker-compose exec app bin/console [command]
```

**Examples:**
```bash
# Clear cache
docker-compose exec app bin/console cache:clear

# List all routes
docker-compose exec app bin/console debug:router
```

### Viewing Logs

```bash
# Follow application logs
docker-compose logs -f app

# View all service logs
docker-compose logs -f
```

### Stopping the Application

```bash
docker-compose down
```

To also remove volumes:
```bash
docker-compose down -v
```

---

## Deployment

### Deploy to Fly.io

This project is pre-configured for Fly.io deployment via `fly.toml`.

**Steps:**

1. **Install Fly CLI**
   ```bash
   curl -L https://fly.io/install.sh | sh
   ```

2. **Authenticate**
   ```bash
   fly auth login
   ```

3. **Deploy**
   ```bash
   fly deploy
   ```

4. **Open your app**
   ```bash
   fly open
   ```

---

## CI/CD

GitHub Actions workflows in `.github/workflows/` automate:

- Code quality checks
- Automated testing
- Container image building
- Deployment pipelines

Workflows trigger automatically on:
- Push to `main` branch
- Pull request creation
- Manual workflow dispatch

---

## Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

This project is open source and available for educational and development purposes.

---

## Acknowledgments

Built with:
- [Symfony](https://symfony.com/) - PHP framework
- [Docker](https://www.docker.com/) - Containerization
- [Fly.io](https://fly.io/) - Deployment platform
- [GitHub Actions](https://github.com/features/actions) - CI/CD automation

---

## Support

If you encounter any issues or have questions:
- Open an [issue](https://github.com/WookieWil/devops-symfony/issues)
- Check existing [discussions](https://github.com/WookieWil/devops-symfony/discussions)
