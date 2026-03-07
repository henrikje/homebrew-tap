class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.104.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-darwin-arm64.tar.gz"
      sha256 "c142a7a99b1abf5eb2a5a544ddd6b8e51ad56586708efcf767cc668962a8b50c"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-darwin-x64.tar.gz"
      sha256 "c56fc9a9e90847f5fcd5dfff4f69c9c59f6aeca9f3d1e6c8b586eaf4ab14a70c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-linux-arm64.tar.gz"
      sha256 "3513e1980d0c7eb954e16b8150263649e2a790e50c815fbd923a0d523d29983e"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.104.0/arb-0.104.0-linux-x64.tar.gz"
      sha256 "d0e219020416fd02982d77c638239e8fb136312e3aad08253f37011d28f6aedd"
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
