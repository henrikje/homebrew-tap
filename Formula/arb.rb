class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.115.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.2/arb-0.115.2-darwin-arm64.tar.gz"
      sha256 "23ae8cfa84f7139eb476ef77fae2665b251f5533dccdbe367d514fa5eeacd779"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.2/arb-0.115.2-darwin-x64.tar.gz"
      sha256 "554472bc0bfcce59f7f8c435b98cf7c8d916a9afdbebeca4c002527dfdfd8587"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.2/arb-0.115.2-linux-arm64.tar.gz"
      sha256 "8bac52d01b77924a1b8b369781807f1ce977526c26ad0385b29aceec320b77c1"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.115.2/arb-0.115.2-linux-x64.tar.gz"
      sha256 "a26d759d634c479a64aa754bd1e5bdfa95c324d9a583915a903b82d4775519eb"
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
