class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.110.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.110.0/arb-0.110.0-darwin-arm64.tar.gz"
      sha256 "9af5804209ac3df1ef38c4ba17485fe185ac0d25dea29590f41a8cd517373653"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.110.0/arb-0.110.0-darwin-x64.tar.gz"
      sha256 "5d72995b858e765d336f7f83acab19292c999ffb0f1d5eb585c273df7e2c32d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.110.0/arb-0.110.0-linux-arm64.tar.gz"
      sha256 "a474dc0c12c2933f009fa552a73d8ed0b5aaf204935a1d9db3d885fb696a0367"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.110.0/arb-0.110.0-linux-x64.tar.gz"
      sha256 "556b7b578f88a12e820e9f108efa79bebc8c34b6c4a2a0dff55f4085960bcb37"
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
