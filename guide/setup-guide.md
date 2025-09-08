# Setup Guide

This guide will help you set up the Recipe App API development environment.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) (version 20.10 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or higher)
- [Git](https://git-scm.com/downloads)

## 🚀 Initial Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd recipe-app-api
```

### 2. Verify Docker Installation
```bash
# Check Docker version
docker --version

# Check Docker Compose version
docker-compose --version

# Test Docker is running
docker run hello-world
```

### 3. Build the Application
```bash
# Build the Docker image
docker-compose build

# This will:
# - Install Python 3.12
# - Install Poetry
# - Install all dependencies (including dev dependencies)
# - Set up the development environment
```

### 4. Run the Application
```bash
# Start the development server
docker-compose up

# The application will be available at: http://localhost:8000
```

## 🔧 Development Environment

### Project Structure
```
recipe-app-api/
├── src/                    # Django application source code
│   ├── .flake8            # Flake8 configuration
│   └── manage.py          # Django management script
├── guide/                 # Documentation and guides
├── docker-compose.yml     # Docker Compose configuration
├── dockerfile            # Docker image definition
├── pyproject.toml        # Poetry configuration
├── poetry.lock           # Dependency lock file
└── README.md             # Project documentation
```

### Development vs Production

The Docker setup supports both development and production modes:

#### Development Mode (Default)
- Installs all dependencies including dev tools
- Mounts source code for live reloading
- Includes debugging tools
- Uses `DEV=true` argument

#### Production Mode
- Installs only production dependencies
- Optimized for size and security
- No dev tools included
- Uses `DEV=false` argument

## 🛠️ Development Workflow

### 1. Daily Development
```bash
# Start development environment
docker-compose up -d

# Check application status
docker-compose ps

# View logs
docker-compose logs -f app
```

### 2. Code Quality
```bash
# Run linting
docker-compose run --rm app sh -c "cd src && poetry run flake8 ."

# Run tests
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test"
```

### 3. Database Operations
```bash
# Run migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py migrate"

# Create new migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py makemigrations"
```

### 4. Adding Dependencies
```bash
# Add production dependency
docker-compose run --rm app sh -c "poetry add package-name"

# Add development dependency
docker-compose run --rm app sh -c "poetry add --group dev package-name"

# Rebuild after adding dependencies
docker-compose build
```

## 🧪 Testing

### Running Tests
```bash
# Run all tests
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test"

# Run specific test file
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test config.tests"

# Run with verbose output
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test --verbosity=2"
```

### Test Coverage
```bash
# Run tests with coverage
docker-compose run --rm app sh -c "cd src && poetry run coverage run --source='.' manage.py test && poetry run coverage report"
```

## 🐛 Debugging

### Container Debugging
```bash
# Access container shell
docker-compose exec app sh

# Check Poetry environment
docker-compose run --rm app sh -c "poetry env info"

# Check installed packages
docker-compose run --rm app sh -c "poetry show"
```

### Django Debugging
```bash
# Open Django shell
docker-compose run --rm app sh -c "cd src && poetry run python manage.py shell"

# Run Django commands
docker-compose run --rm app sh -c "cd src && poetry run python manage.py check"
```

## 📦 Package Management

### Poetry Commands
```bash
# Show project info
docker-compose run --rm app sh -c "poetry show"

# Update dependencies
docker-compose run --rm app sh -c "poetry update"

# Generate lock file
docker-compose run --rm app sh -c "poetry lock"

# Install dependencies
docker-compose run --rm app sh -c "poetry install"
```

## 🚀 Deployment

### Production Build
```bash
# Build production image
docker build -t recipe-app-api:production .

# Run production container
docker run -p 8000:8000 recipe-app-api:production
```

### Environment Variables
Create a `.env` file for environment-specific settings:
```bash
# .env
DJANGO_SETTINGS_MODULE=settings.production
DATABASE_URL=postgresql://user:password@db:5432/recipe_db
SECRET_KEY=your-secret-key
```

## 🆘 Troubleshooting

### Common Issues

1. **Container won't start**
   ```bash
   # Check logs
   docker-compose logs app
   
   # Rebuild without cache
   docker-compose build --no-cache
   ```

2. **Port conflicts**
   ```bash
   # Check what's using port 8000
   netstat -tulpn | grep :8000
   
   # Change port in docker-compose.yml
   ```

3. **Permission issues**
   ```bash
   # Fix file permissions
   sudo chown -R $USER:$USER .
   ```

4. **Poetry lock file issues**
   ```bash
   # Regenerate lock file
   docker-compose run --rm app sh -c "poetry lock"
   ```

### Getting Help

- Check the [Docker Commands Guide](./docker-commands.md)
- Review Docker and Docker Compose logs
- Consult the [Django Documentation](https://docs.djangoproject.com/)
- Check the [Poetry Documentation](https://python-poetry.org/docs/)

## 📚 Next Steps

1. Read the [Docker Commands Guide](./docker-commands.md) for detailed command reference
2. Explore the source code in the `src/` directory
3. Set up your IDE for Docker development
4. Configure your preferred code editor for Python/Django development

## 🤝 Contributing

When contributing to this project:

1. Follow the code style guidelines (flake8 configuration)
2. Write tests for new features
3. Update documentation as needed
4. Use meaningful commit messages
5. Test your changes in the Docker environment

