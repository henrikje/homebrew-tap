class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.103.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.103.0/arb-0.103.0-darwin-arm64.tar.gz"
      sha256 "40d35304dba4878a347a3080fe9e7f47215e242ac7e3f1348e0c67e77bd14f35"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.103.0/arb-0.103.0-darwin-x64.tar.gz"
      sha256 "f19f63fb50a6b85db372f914b7b702ef13909db7524b9ed1f866440e24328634"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.103.0/arb-0.103.0-linux-arm64.tar.gz"
      sha256 "76348ca61fc557d3fec65c9f135282dcdf39cee7e42a59664bebc007cb15d97f"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.103.0/arb-0.103.0-linux-x64.tar.gz"
      sha256 "b28d33f7dff0523426c796aa09000f1a31df3955d6facd52d63ce95b4b46f51b"
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
