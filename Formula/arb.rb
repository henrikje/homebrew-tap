class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.111.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.111.0/arb-0.111.0-darwin-arm64.tar.gz"
      sha256 "9d42426d639c5ac5e4da8c625922cd70ad96ec017a3b2c2c835ffb0b75146ccb"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.111.0/arb-0.111.0-darwin-x64.tar.gz"
      sha256 "8e47b81f739c9d86cb5901f83c55397e66f85a99eab8212d63b021fe98b0d75b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.111.0/arb-0.111.0-linux-arm64.tar.gz"
      sha256 "e39674d1cc361c84985c27b488c1120270197b427f1850903b36c45cbd69a8c7"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.111.0/arb-0.111.0-linux-x64.tar.gz"
      sha256 "d6bd75246d4d33de1c2fcbcee5e6e863bd709914c5ec1c63766d7c1b1dc99447"
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
