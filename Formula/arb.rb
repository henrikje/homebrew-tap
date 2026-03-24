class Arb < Formula
  desc "Workspace manager for multi-repo projects built on Git worktrees"
  homepage "https://github.com/henrikje/arborist"
  version "0.113.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.113.0/arb-0.113.0-darwin-arm64.tar.gz"
      sha256 "a39dd411744066e85d33b99380c7863569b8a3a04f7f92cfa0425ea89b983cb4"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.113.0/arb-0.113.0-darwin-x64.tar.gz"
      sha256 "fdb925f0c53bbe6742c7c0219a652b400079947e163b30b504f2c684851da7e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrikje/arborist/releases/download/v0.113.0/arb-0.113.0-linux-arm64.tar.gz"
      sha256 "8e46a2f55b66ad3440cfbcfb63b0cfcdd0ac6af0c15d8d2945e914101539ec0a"
    end
    on_intel do
      url "https://github.com/henrikje/arborist/releases/download/v0.113.0/arb-0.113.0-linux-x64.tar.gz"
      sha256 "886baea9a05d76945d38b436f052d8ab15e4d52509bfe6da84d6a44e70869dd1"
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
