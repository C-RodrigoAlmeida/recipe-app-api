# Guide Documentation

This folder contains comprehensive documentation for the Recipe App API Docker setup and development workflow.

## 📚 Available Guides

### [Setup Guide](./setup-guide.md)
Complete setup instructions for new developers including:
- Prerequisites and installation
- Initial project setup
- Development environment configuration
- Daily workflow
- Troubleshooting common issues

### [Docker Commands Guide](./docker-commands.md)
Comprehensive reference for all Docker-related commands:
- Development commands
- Code quality tools (flake8, testing)
- Django management commands
- Database operations
- Production deployment
- Debugging and troubleshooting

### [Quick Reference](./quick-reference.md)
Essential commands and shortcuts for daily development:
- Most commonly used commands
- Useful aliases
- Quick troubleshooting tips

## 🎯 Getting Started

1. **New to the project?** Start with the [Setup Guide](./setup-guide.md)
2. **Need a specific command?** Check the [Docker Commands Guide](./docker-commands.md)
3. **Quick daily reference?** Use the [Quick Reference](./quick-reference.md)

## 🔧 Project Overview

This project uses:
- **Docker & Docker Compose** for containerization
- **Poetry** for Python dependency management
- **Django** as the web framework
- **Flake8** for code linting
- **Multi-stage builds** for optimized production images

## 📖 Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Poetry Documentation](https://python-poetry.org/docs/)
- [Django Documentation](https://docs.djangoproject.com/)
- [Flake8 Documentation](https://flake8.pycqa.org/)

## 🤝 Contributing

When updating these guides:
1. Keep commands up-to-date with the current setup
2. Test all commands before documenting
3. Include examples and expected outputs
4. Update all related guides when making changes
5. Follow the existing format and structure

## 📝 Notes

- All commands assume you're in the project root directory
- Commands are tested on Linux/macOS; Windows users may need slight modifications
- The `--rm` flag removes containers after execution to keep the system clean
- Development mode (`DEV=true`) is used by default in docker-compose.yml

