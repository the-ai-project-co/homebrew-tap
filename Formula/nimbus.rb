class Nimbus < Formula
  desc "AI-powered DevOps CLI -- Terraform, Kubernetes, Helm in your terminal"
  homepage "https://github.com/the-ai-project-co/nimbus"
  version "0.4.2"
  license "MIT"

  # Pre-compiled standalone binaries — no Node.js or tsx required.
  on_macos do
    on_arm do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.2/nimbus-darwin-arm64.tar.gz"
      sha256 "7b7798ae7240df7c0dcd5c7b6f642f97fc02bf1d67e1060d22addc89e1dd3766"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.2/nimbus-darwin-x64.tar.gz"
      sha256 "1512a99e8f29482fefe6aaf504f904db07b11625839a10b453d77e95de5de2b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.2/nimbus-linux-arm64.tar.gz"
      sha256 "661e69268db872c6ddee3b37c8a9851fa6077a46b3bb0f2d427b2dce50adc307"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/nimbus/releases/download/v0.4.2/nimbus-linux-x64.tar.gz"
      sha256 "491ea4380935f4dc704924f9cf7ebfafbd20330fca4d5414b802ce5041b28274"
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
