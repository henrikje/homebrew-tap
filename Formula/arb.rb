class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.107.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.107.0/arb-0.107.0-darwin-arm64.tar.gz"
      sha256 "4ccc322acf5ba32ac8003f60a8a9b1c2de86f740fce7bdfd6dbffbcc38a1da55"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.107.0/arb-0.107.0-darwin-x64.tar.gz"
      sha256 "52f9d6c69b16d2adc353c13f9e6e512aa2678fc6f96f689e0330e7f0976fec21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.107.0/arb-0.107.0-linux-arm64.tar.gz"
      sha256 "bde0783ea75f1a0514af0a44a840d7a3c83328214afdcf1c3f3e869c37e22af3"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.107.0/arb-0.107.0-linux-x64.tar.gz"
      sha256 "411c94b3b3f87dd6aa463b5c0ca75d04a023f1cfe84c42e4ae7521969224ee08"
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
