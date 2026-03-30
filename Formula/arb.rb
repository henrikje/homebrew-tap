class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.115.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.0/arb-0.115.0-darwin-arm64.tar.gz"
      sha256 "15c96c6f7584cfafab96e51469e0cbf9a2efdd575f43cbc24a7be73e4f853d97"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.0/arb-0.115.0-darwin-x64.tar.gz"
      sha256 "e2bce6073f41e0cdf6cc73586ca7f62fa8259e2046f0eebbc13858568c95ec39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.0/arb-0.115.0-linux-arm64.tar.gz"
      sha256 "8e986df09f76c3a6d8972cb8780605e5683cb72a83e9aa5244e814a2615b8b31"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.0/arb-0.115.0-linux-x64.tar.gz"
      sha256 "53fbae89e4b25345e0f334e1c450250539b5f5dd1566b0cc673b60373db82f9e"
    end
  end

  def install
    bin.install "arb"
    (share/"arb").install "shell/arb.zsh"
    (share/"arb").install "shell/arb.bash"
  end

  def caveats
    <<~EOS
      To enable the shell function (required for arb cd), add to your shell profile:

          For zsh (~/.zshrc):
              source "#{share}/arb/arb.zsh"

          For bash (~/.bashrc):
              source "#{share}/arb/arb.bash"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arb --version")
  end
end
