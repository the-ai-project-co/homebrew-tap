class Astron < Formula
  desc "AI-powered DevOps automation platform — generate configs, orchestrate workflows, operate infrastructure"
  homepage "https://github.com/the-ai-project-co/astron-bots"
  version "2.0.0"
  license "MIT"

  # Pre-compiled standalone binaries (Bun) — no Node.js required.
  # SHA256s are updated automatically by .github/workflows/release.yml
  # in the astron-bots repo on every GitHub release.
  on_macos do
    on_arm do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.0.0/astron-darwin-arm64"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.0.0/astron-darwin-x64"
      sha256 "PLACEHOLDER_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.0.0/astron-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.0.0/astron-linux-x64"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "astron-darwin-arm64" => "astron"
    elsif OS.mac?
      bin.install "astron-darwin-x64" => "astron"
    elsif Hardware::CPU.arm?
      bin.install "astron-linux-arm64" => "astron"
    else
      bin.install "astron-linux-x64" => "astron"
    end
  end

  def caveats
    <<~EOS
      Astron v2.0.0 — AI-powered DevOps platform.

      Run the setup wizard to configure your LLM provider:
        astron init

      Available bots:
        cicd        — GitHub Actions workflows (Comet)
        docker      — Dockerfiles, docker-compose (Nebula)
        kubernetes  — K8s manifests, Helm charts (Cosmos)
        terraform   — Infrastructure as Code (Terra)
        deployment  — Blue-green, canary, rolling (Pulsar)
        security    — Scanning, compliance, SBOM (Sentinel)
        observability — Prometheus, Grafana, alerts (Beacon)

      Start the chat UI (requires Docker):
        docker compose --profile chat up -d
        open http://localhost:4000

      Full docs: https://github.com/the-ai-project-co/astron-bots

      Optional CLI dependencies for full functionality:
        brew install hashicorp/tap/terraform
        brew install kubernetes-cli
        brew install helm
        brew install awscli
    EOS
  end

  test do
    assert_match "2", shell_output("#{bin}/astron --version 2>&1")
  end
end
