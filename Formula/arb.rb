class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.101.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.101.0/arb-0.101.0-darwin-arm64.tar.gz"
      sha256 "78d861bcb2351e787c481364df5f62a384ec3244a8cae8d99a36d26d90aad12a"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.101.0/arb-0.101.0-darwin-x64.tar.gz"
      sha256 "d2b452cd61bf07ec30421349dfde00dd3eee4c854bd3712e04e4c6fad63042ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.101.0/arb-0.101.0-linux-arm64.tar.gz"
      sha256 "5b635e49c48f5faf9a8c9c899ad8986f90345a44da20673a5fff64ebf7b11940"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.101.0/arb-0.101.0-linux-x64.tar.gz"
      sha256 "8a9ac9d4844aea79a03d4428abe52ba64c56826072096af67a1eac1c40247ac6"
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
