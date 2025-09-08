# Troubleshooting Guide

This guide covers common issues and their solutions when working with the Recipe App API Docker setup.

## 🐳 Docker Issues

### Container Won't Start

**Problem**: Container fails to start or exits immediately.

**Solutions**:
```bash
# Check container logs
docker-compose logs app

# Check container status
docker-compose ps

# Rebuild without cache
docker-compose build --no-cache

# Remove containers and volumes
docker-compose down -v
docker-compose up
```

### Port Already in Use

**Problem**: Error message about port 8000 being already in use.

**Solutions**:
```bash
# Find process using port 8000
netstat -tulpn | grep :8000
# or on Windows
netstat -ano | findstr :8000

# Kill the process (replace PID with actual process ID)
kill -9 <PID>
# or on Windows
taskkill /PID <PID> /F

# Alternative: Change port in docker-compose.yml
# Change "8000:8000" to "8001:8000"
```

### Permission Denied Errors

**Problem**: Permission errors when accessing files or running commands.

**Solutions**:
```bash
# Fix file ownership
sudo chown -R $USER:$USER .

# Fix Docker permissions (Linux)
sudo usermod -aG docker $USER
# Log out and back in

# On Windows, run Docker Desktop as administrator
```

### Docker Daemon Not Running

**Problem**: "Cannot connect to the Docker daemon" error.

**Solutions**:
```bash
# Start Docker service (Linux)
sudo systemctl start docker

# On Windows/macOS, start Docker Desktop application

# Check Docker status
docker info
```

## 🐍 Python/Poetry Issues

### Poetry Lock File Issues

**Problem**: "pyproject.toml changed significantly since poetry.lock was last generated"

**Solutions**:
```bash
# Regenerate lock file
docker-compose run --rm app sh -c "poetry lock"

# If that fails, remove and recreate
docker-compose run --rm app sh -c "rm poetry.lock && poetry lock"

# Rebuild container
docker-compose build
```

### Virtual Environment Not Found

**Problem**: "Virtualenv not found" or Poetry can't find virtual environment.

**Solutions**:
```bash
# Check Poetry environment info
docker-compose run --rm app sh -c "poetry env info"

# Recreate virtual environment
docker-compose run --rm app sh -c "poetry env remove python && poetry install"

# Rebuild container
docker-compose build
```

### Package Installation Failures

**Problem**: Packages fail to install or are not found.

**Solutions**:
```bash
# Clear Poetry cache
docker-compose run --rm app sh -c "poetry cache clear pypi --all"

# Update Poetry
docker-compose run --rm app sh -c "pip install --upgrade poetry"

# Rebuild with no cache
docker-compose build --no-cache
```

## 🗄️ Database Issues

### Migration Failures

**Problem**: Django migrations fail to run.

**Solutions**:
```bash
# Check migration status
docker-compose run --rm app sh -c "cd src && poetry run python manage.py showmigrations"

# Reset migrations (CAUTION: This will delete data)
docker-compose run --rm app sh -c "cd src && poetry run python manage.py migrate --fake-initial"

# Create new migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py makemigrations"
```

### Database Connection Issues

**Problem**: Cannot connect to database.

**Solutions**:
```bash
# Check if database container is running
docker-compose ps

# Restart database service
docker-compose restart db

# Check database logs
docker-compose logs db
```

## 🔧 Development Tools Issues

### Flake8 Not Found

**Problem**: "flake8: command not found" error.

**Solutions**:
```bash
# Check if flake8 is installed
docker-compose run --rm app sh -c "poetry show flake8"

# Reinstall dev dependencies
docker-compose run --rm app sh -c "poetry install --with dev"

# Rebuild container
docker-compose build
```

### Tests Not Running

**Problem**: Tests fail to run or are not found.

**Solutions**:
```bash
# Check test discovery
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test --verbosity=2"

# Run specific test
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test config.tests"

# Check Django configuration
docker-compose run --rm app sh -c "cd src && poetry run python manage.py check"
```

## 🚀 Performance Issues

### Slow Build Times

**Problem**: Docker builds take too long.

**Solutions**:
```bash
# Use build cache
docker-compose build

# Clean up unused resources
docker system prune -a

# Use multi-stage builds (already implemented)
# Check .dockerignore file is comprehensive
```

### High Memory Usage

**Problem**: Docker containers use too much memory.

**Solutions**:
```bash
# Check resource usage
docker stats

# Limit container resources in docker-compose.yml
services:
  app:
    deploy:
      resources:
        limits:
          memory: 512M
```

## 🔍 Debugging Commands

### Container Debugging
```bash
# Access container shell
docker-compose exec app sh

# Check container processes
docker-compose exec app ps aux

# Check container environment
docker-compose exec app env

# Check file system
docker-compose exec app ls -la /app
```

### Application Debugging
```bash
# Check Django configuration
docker-compose run --rm app sh -c "cd src && poetry run python manage.py check --deploy"

# Check installed packages
docker-compose run --rm app sh -c "poetry show"

# Check Python path
docker-compose run --rm app sh -c "cd src && poetry run python -c 'import sys; print(sys.path)'"
```

## 📋 Diagnostic Checklist

When encountering issues, follow this checklist:

1. **Check Docker status**
   ```bash
   docker --version
   docker-compose --version
   docker info
   ```

2. **Check container status**
   ```bash
   docker-compose ps
   docker-compose logs app
   ```

3. **Check file permissions**
   ```bash
   ls -la
   ```

4. **Check Poetry environment**
   ```bash
   docker-compose run --rm app sh -c "poetry env info"
   ```

5. **Check Django configuration**
   ```bash
   docker-compose run --rm app sh -c "cd src && poetry run python manage.py check"
   ```

6. **Rebuild if necessary**
   ```bash
   docker-compose build --no-cache
   ```

## 🆘 Getting Help

If you're still experiencing issues:

1. Check the [Docker Commands Guide](./docker-commands.md)
2. Review the [Setup Guide](./setup-guide.md)
3. Check Docker and application logs
4. Search for similar issues in the project documentation
5. Consult the official documentation for Docker, Poetry, and Django

## 📝 Reporting Issues

When reporting issues, include:

1. Operating system and version
2. Docker and Docker Compose versions
3. Complete error messages
4. Steps to reproduce the issue
5. Output of diagnostic commands
6. Any relevant log files

