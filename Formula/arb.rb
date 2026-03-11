class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.108.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.108.0/arb-0.108.0-darwin-arm64.tar.gz"
      sha256 "bc082ae2b6783ad8488281c0f29495973e644d4b6d447561cb6db6b33a560f83"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.108.0/arb-0.108.0-darwin-x64.tar.gz"
      sha256 "68e41f42b82f9ce15421d088c41d6611b943306f5f753ec485033555f5551b2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.108.0/arb-0.108.0-linux-arm64.tar.gz"
      sha256 "f5415bd22c65cbfee57824484af1fd470dd7cb67455d15615b416f6bf5ef65eb"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.108.0/arb-0.108.0-linux-x64.tar.gz"
      sha256 "84495cfb89f5345921f1c85754755d2eaa1a7471c17893eee852886279bcffa5"
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
