class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.115.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.3/arb-0.115.3-darwin-arm64.tar.gz"
      sha256 "28d7bb14158dabef0b344d4be7088586823f61fb9eb319e7442e3affe334dfce"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.3/arb-0.115.3-darwin-x64.tar.gz"
      sha256 "5454af149b7ebc1edc9d92c39a5453c27ff43c4a3fe7eac8398fd66c731ba602"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.3/arb-0.115.3-linux-arm64.tar.gz"
      sha256 "696c7e1b26639c84225950f669aa759f1fee10d635d2e4aa80bb2e97f7b068ce"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.3/arb-0.115.3-linux-x64.tar.gz"
      sha256 "3b636ddcd8f1338c9ad50ff5550e6e4ba04b0a65e28fbb095e568bca79f22229"
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
