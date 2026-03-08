class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.104.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.1/arb-0.104.1-darwin-arm64.tar.gz"
      sha256 "55b9fd7d2bb46118d3427f31349307f2fb0f58e8bfc1dc6ed54854801728a758"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.1/arb-0.104.1-darwin-x64.tar.gz"
      sha256 "a89cc15e9d40b9332825667a913a6d6581e2f91c773c39f5a3ab23060dea5a1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.1/arb-0.104.1-linux-arm64.tar.gz"
      sha256 "ae207b5edda4266af5d1df1165efc9bdde90de69d4895ceb311da3de6c8976db"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.1/arb-0.104.1-linux-x64.tar.gz"
      sha256 "85a0b4191a20519c863f5059b07fb6d7eab8bc6b57c37cf799d2b5d77c020b69"
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
