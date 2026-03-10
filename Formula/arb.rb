class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.105.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.105.0/arb-0.105.0-darwin-arm64.tar.gz"
      sha256 "b5099bc7cf6f8efe4f887d171ad11ad8bcb1ea5c83214917daf0c5389372a8cb"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.105.0/arb-0.105.0-darwin-x64.tar.gz"
      sha256 "6281cf78d405bc2ab33d44a06cf5a6995f9c37e7040c956750c26d77ff676c98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.105.0/arb-0.105.0-linux-arm64.tar.gz"
      sha256 "592ef67d1b9e1ad38c817f1d9c33307c1fb15cb84edeb06edcccb5f38b4bbb6c"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.105.0/arb-0.105.0-linux-x64.tar.gz"
      sha256 "7e1af17ff18a3d3a9579266ca012826a90786b9a90bd8bbd2610236f43357429"
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
