# Docker Commands Guide

This guide covers all the essential Docker commands for the Recipe App API project.

## 🚀 Quick Start

### Build and Run
```bash
# Build the Docker image
docker-compose buildmmand is t

# Run the application
docker-compose up

# Run in background (detached mode)
docker-compose up -d

# Stop the application
docker-compose down
```

## 🔧 Development Commands

### Code Quality Tools

#### Flake8 (Code Linting)
```bash
# Run flake8 on the entire source code
docker-compose run --rm app sh -c "cd src && poetry run flake8 ."

# Run flake8 with specific options
docker-compose run --rm app sh -c "cd src && poetry run flake8 --max-line-length=88 ."

# Run flake8 on specific files
docker-compose run --rm app sh -c "cd src && poetry run flake8 app/models.py app/views.py"
```

#### Poetry Commands
```bash
# Install new dependencies
docker-compose run --rm app sh -c "poetry add package-name"

# Install dev dependencies
docker-compose run --rm app sh -c "poetry add --group dev package-name"

# Update dependencies
docker-compose run --rm app sh -c "poetry update"

# Show installed packages
docker-compose run --rm app sh -c "poetry show"

# Generate lock file
docker-compose run --rm app sh -c "poetry lock"
```

### Django Commands

#### Database Operations
```bash
# Run migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py migrate"

# Create migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py makemigrations"

# Create superuser
docker-compose run --rm app sh -c "cd src && poetry run python manage.py createsuperuser"

# Load fixtures
docker-compose run --rm app sh -c "cd src && poetry run python manage.py loaddata fixture.json"
```

#### Development Server
```bash
# Run development server
docker-compose run --rm app sh -c "cd src && poetry run python manage.py runserver 0.0.0.0:8000"

# Run with specific settings
docker-compose run --rm app sh -c "cd src && poetry run python manage.py runserver 0.0.0.0:8000 --settings=settings.development"
```

#### Django Shell
```bash
# Open Django shell
docker-compose run --rm app sh -c "cd src && poetry run python manage.py shell"

# Run Python script
docker-compose run --rm app sh -c "cd src && poetry run python manage.py shell < script.py"
```

## 🧪 Testing Commands

```bash
# Run all tests
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test"

# Run specific test
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test config.tests.TestModel"

# Run tests with coverage
docker-compose run --rm app sh -c "cd src && poetry run coverage run --source='.' manage.py test && poetry run coverage report"
```

## 🐳 Docker Management

### Container Operations
```bash
# View running containers
docker-compose ps

# View logs
docker-compose logs app

# Follow logs in real-time
docker-compose logs -f app

# Execute commands in running container
docker-compose exec app sh

# Remove containers and volumes
docker-compose down -v
```

### Image Management
```bash
# Build without cache
docker-compose build --no-cache

# Remove unused images
docker image prune

# Remove all unused Docker resources
docker system prune -a
```

## 🔍 Debugging Commands

### Container Inspection
```bash
# Check container status
docker-compose ps

# View container logs
docker-compose logs app

# Access container shell
docker-compose exec app sh

# Check Poetry environment
docker-compose run --rm app sh -c "poetry env info"

# Check installed packages
docker-compose run --rm app sh -c "poetry show"
```

### File System Access
```bash
# Copy files from container
docker cp container_name:/app/src/file.py ./local_file.py

# Copy files to container
docker cp ./local_file.py container_name:/app/src/file.py
```

## 🚀 Production Commands

### Build Production Image
```bash
# Build production image (without dev dependencies)
docker build -t recipe-app-api:production .

# Run production container
docker run -p 8000:8000 recipe-app-api:production
```

### Environment Variables
```bash
# Run with environment variables
docker-compose run --rm app sh -c "DJANGO_SETTINGS_MODULE=settings.production poetry run python manage.py migrate"
```

## 📝 Useful Aliases

Add these to your shell profile (`.bashrc`, `.zshrc`, etc.) for convenience:

```bash
# Docker Compose aliases
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcr="docker-compose run --rm app sh -c"

# Django aliases
alias dmigrate="docker-compose run --rm app sh -c 'cd src && poetry run python manage.py migrate'"
alias dtest="docker-compose run --rm app sh -c 'cd src && poetry run python manage.py test'"
alias dflake8="docker-compose run --rm app sh -c 'cd src && poetry run flake8 .'"
```

## 🆘 Troubleshooting

### Common Issues

1. **Port already in use**
   ```bash
   # Find process using port 8000
   netstat -tulpn | grep :8000
   # Kill the process or change port in docker-compose.yml
   ```

2. **Permission issues**
   ```bash
   # Fix file permissions
   sudo chown -R $USER:$USER .
   ```

3. **Container won't start**
   ```bash
   # Check logs
   docker-compose logs app
   
   # Rebuild without cache
   docker-compose build --no-cache
   ```

4. **Poetry lock file issues**
   ```bash
   # Regenerate lock file
   docker-compose run --rm app sh -c "poetry lock"
   ```

## 📚 Additional Resources

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Poetry Documentation](https://python-poetry.org/docs/)
- [Django Documentation](https://docs.djangoproject.com/)
- [Flake8 Documentation](https://flake8.pycqa.org/)

