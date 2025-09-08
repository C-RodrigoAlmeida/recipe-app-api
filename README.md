# Recipe App API

A Django RESTful API for managing food recipes, built with modern development practices and containerized with Docker.

## 🚀 Quick Start

```bash
# Clone the repository
git clone <repository-url>
cd recipe-app-api

# Build and run with Docker
docker-compose build
docker-compose up
```

The application will be available at: http://localhost:8000

## 📚 Documentation

Comprehensive documentation is available in the [`guide/`](./guide/) folder:

- **[Setup Guide](./guide/setup-guide.md)** - Complete setup instructions for new developers
- **[Docker Commands](./guide/docker-commands.md)** - Comprehensive command reference
- **[Quick Reference](./guide/quick-reference.md)** - Essential commands for daily development
- **[Troubleshooting](./guide/troubleshooting.md)** - Common issues and solutions

## 🛠️ Tech Stack

- **Backend**: Django 5.2, Django REST Framework
- **Containerization**: Docker, Docker Compose
- **Dependency Management**: Poetry
- **Code Quality**: Flake8
- **Database**: PostgreSQL (production), SQLite (development)

## 🔧 Development

### Code Quality
```bash
# Run linting
docker-compose run --rm app sh -c "cd src && poetry run flake8 ."

# Run tests
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test"
```

### Database Operations
```bash
# Run migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py migrate"

# Create superuser
docker-compose run --rm app sh -c "cd src && poetry run python manage.py createsuperuser"
```

## 📖 Course Information

This project is part of an Udemy Django RESTful API course, demonstrating modern Python web development practices with Docker containerization.
