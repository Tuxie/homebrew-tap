class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.10.3"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "0fabd8cf4b444ed192e8019f443fc205a6f17731bf44d4c750c5b9419cffc412"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "48607c4c8be341628768021cf31f69a0f5767f6bb12e6e523d78353c9addded7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "07dc0d2377492a1d3c48574e2291fd359c05816d32e042c022b0832a03cdd4f7"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "0d5a7d0730c480b9980455bc23a46e717149ee472432eacb2cce87d352d7a281"
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
