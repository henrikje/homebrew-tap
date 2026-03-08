class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.104.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-darwin-arm64.tar.gz"
      sha256 "64318b7691060287d4990db2a03b70ddf5db86f6f3bdfa7aa7903e8c8390f008"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-darwin-x64.tar.gz"
      sha256 "71a5f496496ac0a0ca252e25b1d48c8a3595b50478947375f97e5103d6a7de55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-linux-arm64.tar.gz"
      sha256 "ef88fad5061a5b75e22d615466124e3b118ccee2e629d23040b164e7b5a10c97"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-linux-x64.tar.gz"
      sha256 "6e6371c94f4752b17350dd236f0dcead0a3750e2690c8117fd34b2817acfb457"
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
