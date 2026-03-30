class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.115.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.1/arb-0.115.1-darwin-arm64.tar.gz"
      sha256 "d221e70cf0dc9f7d150fa5d8b2b57543f763830b9d6cba2a7873d187c010bc0f"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.1/arb-0.115.1-darwin-x64.tar.gz"
      sha256 "d8108726818e20f3a0f0f67a6e6ede711a8b4c610fe85fdd33206320847c582b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.1/arb-0.115.1-linux-arm64.tar.gz"
      sha256 "ade7c4ed60762b4302c8b37fbab75a3bef7217ac16cdc88421529d19149532f4"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.1/arb-0.115.1-linux-x64.tar.gz"
      sha256 "06e06573cae3f396bb7816d3541d939998fd1339830fca4277ec33a3f97eb9c4"
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
