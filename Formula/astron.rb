class Astron < Formula
  desc "AI-powered DevOps automation platform — generate configs, orchestrate workflows, operate infrastructure"
  homepage "https://github.com/the-ai-project-co/astron-bots"
  version "2.1.0"
  license "MIT"

  # Pre-compiled standalone binaries (Bun) — no Node.js required.
  # SHA256s are updated automatically by .github/workflows/release.yml
  # in the astron-bots repo on every GitHub release.
  on_macos do
    on_arm do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.1.0/astron-darwin-arm64"
      sha256 "2422b0e2c1796a2a3c8a83f1e799f5d91a2b81ed1c8aceac62f97deb1302eb5c"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.1.0/astron-darwin-x64"
      sha256 "1826d8c6467aa9cd35660d7b17155616c85b3bf00d2c8793524c4d053d04b1f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.1.0/astron-linux-arm64"
      sha256 "2da115aa85893c4c6bcc2a16cbaba79fa0edbecad301164011e37ce2fad84c99"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v2.1.0/astron-linux-x64"
      sha256 "ffcd76cec1a44505ccc338c18ae20bc69e5573e625e4ac35f5a11bad63aebc13"
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
      Astron v2.1.0 — AI-powered DevOps platform.

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
