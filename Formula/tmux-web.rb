class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.6.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "2ed5c7310ce8be2e6deb326c2767e2760cb760ebadbef4be3ca184c221c89ad4"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "ceef653fb223c0a20eb4d0f60c3f56f2d00508c45a0efe7e543e00af24bff9f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "7d0dd919cb666d5cac384d4f77ce8dc701874036d2174821157354ae9a63121d"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "4842991e2233531959960a50ad4e87266f6f00bb7f1f6007757341034e01edc0"
    end
  end

  def install
    bin.install "tmux-web"
    doc.install "README.md", "LICENSE"
    (prefix/"lib/systemd/user").install "tmux-web.service"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmux-web --version")
  end
end
