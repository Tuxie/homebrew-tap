class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.10.4"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "47389fc5653fdcf2969d884e572b23435ec9714910bf23a7ad8726b4613334e9"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "da9a03ee6064d4d8fc217293c8fd69f47724e9d91e11975d19d6a899c80994c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "6a49ce8cf851784de5d48128d99f3ffa576c9b2ab3fe8a0234f10035273c7993"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "077dbccee05cafe8bf60649d8698773b62cadb7c93b1105d44a4fc4f35a1992d"
    end
  end

  def install
    bin.install "tmux-web"
    doc.install "README.md", "LICENSE"
    (prefix/"lib/systemd/user").install "tmux-web.service" if OS.linux?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmux-web --version")
  end
end
