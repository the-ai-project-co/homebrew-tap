class Ops < Formula
  desc "The AI coding agent built for DevOps engineers"
  homepage "https://github.com/the-ai-project-co/ops"
  url "https://github.com/the-ai-project-co/ops/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  version "0.1.0"
  head "https://github.com/the-ai-project-co/ops.git", branch: "main"

  depends_on "bun"

  def install
    # Install dependencies
    system "bun", "install"

    # Create bin directory
    bin.mkpath

    # Create wrapper script
    (bin/"ops").write <<~EOS
      #!/bin/bash
      exec bun #{libexec}/packages/cli/src/index.ts "$@"
    EOS

    # Make wrapper executable
    chmod 0755, bin/"ops"

    # Copy source files to libexec
    libexec.install Dir["*"]
  end

  test do
    # Test that the binary can be executed and shows version
    assert_match version.to_s, shell_output("#{bin}/ops --version")

    # Test help command
    assert_match "The AI coding agent built for DevOps engineers", shell_output("#{bin}/ops --help")
  end
end
