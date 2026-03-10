class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.106.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.106.0/arb-0.106.0-darwin-arm64.tar.gz"
      sha256 "72b007b1eb32ede9b115b3841d6816fde6da8febef519f5ba527aa6eb64fc2ca"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.106.0/arb-0.106.0-darwin-x64.tar.gz"
      sha256 "62c5a0ecfcc6afad7f18b9fc53fc39f71b85013a5801f01b5c342006a45cabe7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.106.0/arb-0.106.0-linux-arm64.tar.gz"
      sha256 "91e489bb001bd3ba86450108991ae55e4bd2a0b881f2a270e8e2d885c49346cf"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.106.0/arb-0.106.0-linux-x64.tar.gz"
      sha256 "dd922c822b259d047d08150eea8983fc30fde4b5901fa164d7c54f32c26b8409"
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
