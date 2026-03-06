class Nimbus < Formula
  desc "AI-powered DevOps CLI -- Terraform, Kubernetes, Helm in your terminal"
  homepage "https://github.com/the-ai-project-co/nimbus"
  url "https://registry.npmjs.org/@build-astron-co/nimbus/-/nimbus-0.4.1.tgz"
  # Get SHA256 with: curl -sL https://registry.npmjs.org/@build-astron-co/nimbus/-/nimbus-0.4.1.tgz | shasum -a 256
  sha256 "PLACEHOLDER_SHA256_FILL_WHEN_PUBLISHED"
  version "0.4.1"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--production", "--ignore-scripts"
    (libexec/"lib").install Dir["*"]
    (bin/"nimbus").write_env_script libexec/"lib/bin/nimbus.mjs", {}
  end

  def caveats
    <<~EOS
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
