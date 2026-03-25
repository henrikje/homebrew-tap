class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.114.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.114.0/arb-0.114.0-darwin-arm64.tar.gz"
      sha256 "65d13c798e34122ad04088d3e0fc10da6316fec4095d68c92acf0c39a06fdf9f"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.114.0/arb-0.114.0-darwin-x64.tar.gz"
      sha256 "29f26e18d379c8676ca3ddc5ec31398b126059cde85b414c5b338119edd1397e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.114.0/arb-0.114.0-linux-arm64.tar.gz"
      sha256 "a836ea245b2ef2932c3f4bc795f9851f7bc56b09a47738f5e036c9fd677e8dde"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.114.0/arb-0.114.0-linux-x64.tar.gz"
      sha256 "358ca49d8e488cd1c4cf4b8b4f4732d3ce6b9330a29386943d7ca62352762f0b"
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
