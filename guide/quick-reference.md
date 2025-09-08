# Quick Reference

## 🚀 Essential Commands

### Start Development
```bash
docker-compose up -d
```

### Stop Development
```bash
docker-compose down
```

### Rebuild Container
```bash
docker-compose build
```

## 🔧 Code Quality

### Linting
```bash
docker-compose run --rm app sh -c "cd src && poetry run flake8 ."
```

### Testing
```bash
docker-compose run --rm app sh -c "cd src && poetry run python manage.py test"
```

## 🗄️ Database

### Migrations
```bash
# Create migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py makemigrations"

# Apply migrations
docker-compose run --rm app sh -c "cd src && poetry run python manage.py migrate"
```

### Django Shell
```bash
docker-compose run --rm app sh -c "cd src && poetry run python manage.py shell"
```

## 📦 Dependencies

### Add Package
```bash
# Production
docker-compose run --rm app sh -c "poetry add package-name"

# Development
docker-compose run --rm app sh -c "poetry add --group dev package-name"
```

### Update Dependencies
```bash
docker-compose run --rm app sh -c "poetry update"
```

## 🐳 Docker

### View Logs
```bash
docker-compose logs -f app
```

### Access Container
```bash
docker-compose exec app sh
```

### Clean Up
```bash
docker-compose down -v
docker system prune -a
```

## 🆘 Troubleshooting

### Common Issues
- **Port in use**: Change port in `docker-compose.yml`
- **Permission errors**: `sudo chown -R $USER:$USER .`
- **Lock file issues**: `docker-compose run --rm app sh -c "poetry lock"`

### Useful Aliases
```bash
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcr="docker-compose run --rm app sh -c"
alias dmigrate="docker-compose run --rm app sh -c 'cd src && poetry run python manage.py migrate'"
alias dtest="docker-compose run --rm app sh -c 'cd src && poetry run python manage.py test'"
alias dflake8="docker-compose run --rm app sh -c 'cd src && poetry run flake8 .'"
```

