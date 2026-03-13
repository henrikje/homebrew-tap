class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.109.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.109.0/arb-0.109.0-darwin-arm64.tar.gz"
      sha256 "23468b31a8f28d4e2377ff86a44f0c3ddada5ba3b27dac6507cef39d811d4333"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.109.0/arb-0.109.0-darwin-x64.tar.gz"
      sha256 "559b6cb8d0d62dd55e6def00dbe58d30d14d6b36fb9e3a52588299866604919e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.109.0/arb-0.109.0-linux-arm64.tar.gz"
      sha256 "fee7bc6a2bd5fd8bf6258efba5d872db8f6f6e70180bab7127e1b9e235d88eb1"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.109.0/arb-0.109.0-linux-x64.tar.gz"
      sha256 "9be18efd268dcd91ef4fb71b5165888ce7324ee8527b1ea5ef748e8f60ec9be6"
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
