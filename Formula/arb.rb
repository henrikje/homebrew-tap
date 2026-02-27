class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.102.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.102.0/arb-0.102.0-darwin-arm64.tar.gz"
      sha256 "4d53c122592a6e6d597310b705a88162c7fe7b47b95b14c00c1ce23d0a86e71f"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.102.0/arb-0.102.0-darwin-x64.tar.gz"
      sha256 "489038035b514e0f2a37cbde7e430077334e75420fd0bf3b02759b460aa3c769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.102.0/arb-0.102.0-linux-arm64.tar.gz"
      sha256 "0ef740b0697b802b5ba0938c8d6648bd42764f4672d5c38c01454f45f1fde987"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.102.0/arb-0.102.0-linux-x64.tar.gz"
      sha256 "408fb59d21bc4c3f4979a73df901150877df16c1e275f2303ddb384b22d44349"
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
