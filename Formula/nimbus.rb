class Nimbus < Formula
  desc "AI-powered DevOps CLI -- Terraform, Kubernetes, Helm in your terminal"
  homepage "https://github.com/the-ai-project-co/nimbus"
  version "0.4.1"
  license "MIT"

  # Pre-compiled standalone binaries — no Node.js or tsx required.
  on_macos do
    on_arm do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.1/nimbus-darwin-arm64.tar.gz"
      sha256 "f7dc1cb67497b831ff61d8441201d6962f5fbf7c58bb9dc416a284fba6075a7e"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.1/nimbus-darwin-x64.tar.gz"
      sha256 "12185f773fe79a0b095aee14507de393c6276bd4d11dbdd858becd6f0489136f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.1/nimbus-linux-arm64.tar.gz"
      sha256 "a819025a27a864a034b36e47056b6d3862bbb50aa6d20ee2aecbb040456a1ce7"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.1/nimbus-linux-x64.tar.gz"
      sha256 "4fec30b5c98ebefdc26a1a0e2fc8854669cfdb311e71a2422cfc561be9e599e5"
    end
  end

  def install
    bin.install "nimbus"
  end

  def caveats
    <<~EOS
      IMPORTANT: If you previously installed a different "nimbus" from Homebrew
      core (an old IRC client), make sure to uninstall it first:
        brew uninstall --cask nimbus

      Run `nimbus` -- the first-run wizard guides you through API key setup.

      For full DevOps functionality, install optional CLI tools:
        brew install hashicorp/tap/terraform
        brew install kubernetes-cli
        brew install helm
        brew install awscli
    EOS
  end

  test do
    assert_match "nimbus", shell_output("#{bin}/nimbus --version 2>&1")
  end
end
