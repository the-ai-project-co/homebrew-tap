# Homebrew Tap for Nimbus

AI-powered DevOps terminal agent — Terraform, Kubernetes, Helm, and cloud infrastructure management from your terminal.

**Current version: v0.4.2**

## Installation

```bash
brew tap the-ai-project-co/tap
brew install nimbus
```

## Getting Started

After installation, run the first-run wizard to configure your LLM provider:

```bash
nimbus login
```

Then check your DevOps toolchain:

```bash
nimbus doctor
```

## Optional Dependencies

For full DevOps functionality, install the relevant CLI tools:

```bash
brew install hashicorp/tap/terraform
brew install kubernetes-cli
brew install helm
brew install awscli
```

## Upgrade

```bash
brew upgrade nimbus
```

## Uninstall

```bash
brew uninstall nimbus
```

## Available Formulas

- **nimbus** - AI-powered DevOps terminal agent (Terraform, Kubernetes, Helm, AWS, GCP, Azure)

## License

MIT License - see individual formula files for specific licensing information.
