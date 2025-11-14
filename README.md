# homebrew-tap
Official Homebrew tap for The AI Project's open-source tools

## Installation

First, add the tap to your Homebrew:

## Available Formulas

### ops

The AI coding agent built for DevOps engineers - Infrastructure generation, log analysis, and AI-powered DevOps assistance.

```bash
# Install ops
brew install the-ai-project/tap/ops

# Verify installation
ops --version
```

#### Features

- 🐳 **Infrastructure Generation**: Production-ready Dockerfiles, docker-compose, Terraform, Kubernetes manifests
- 📊 **Log Analysis**: Natural language log queries, pattern recognition, root cause analysis
- ☁️ **Multi-Cloud Native**: First-class support for AWS, GCP, Azure
- 🔧 **Command Assistant**: Smart shell command suggestions with explanations
- 🤖 **AI-Powered**: Claude AI integration for intelligent assistance
- 💬 **Interactive Chat**: Real-time DevOps guidance and troubleshooting

#### Quick Start

```bash
# Initialize in your project
ops init

# Generate a Dockerfile
ops generate dockerfile

# Analyze logs
ops analyze logs ./app.log

# Interactive AI chat
ops chat
```

## Development

### Adding New Formulas

1. Create a new formula file in `Formula/`
2. Follow Homebrew formula conventions
3. Test locally with `brew install --build-from-source ./Formula/your-formula.rb`
4. Submit a pull request

### Testing

```bash
# Test formulas
brew test the-ai-project/tap/ops

# Audit formulas
brew audit --strict the-ai-project/tap/ops
```

## Support

### ops
- 📚 [Documentation](https://github.com/the-ai-project-co/ops/tree/main/docs)
- 🐛 [Issues](https://github.com/the-ai-project-co/ops/issues)

## Contributing

We welcome contributions! Please see our [Contributing Guide](https://github.com/the-ai-project-co/ops/blob/main/CONTRIBUTING.md) for details.

## License

MIT License - see individual formula files for specific licensing information.
