class Astron < Formula
  desc "AI-powered DevOps automation platform — generate configs, orchestrate workflows"
  homepage "https://github.com/the-ai-project-co/astron-bots"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v1.0.0/astron-darwin-arm64"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v1.0.0/astron-darwin-x64"
      sha256 "PLACEHOLDER_X64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/the-ai-project-co/astron-bots/releases/download/v1.0.0/astron-linux-x64"
      sha256 "PLACEHOLDER_LINUX"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "astron-darwin-arm64" => "astron"
    elsif OS.mac?
      bin.install "astron-darwin-x64" => "astron"
    else
      bin.install "astron-linux-x64" => "astron"
    end
  end

  test do
    assert_match "astron", shell_output("#{bin}/astron --version 2>&1")
  end
end
