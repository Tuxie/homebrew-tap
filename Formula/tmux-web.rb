class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.11.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "db6ee74ecbcc3d949f4ee4c0b4c913c27d9b0f7fa9a63e6d10fe3f531ff16bc0"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "ed07b1ad47dc8b797837a6562320aa1c7efcdc9f49dd50ead2041b0b0f940e48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "fdbfd1b0e0bcd5928f7d22b1d5d46a5c6e90dcb19be87b72ce7217376140eb02"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "39e11ba8d379dedbb19f4a178d88015cc889b16df7b73a0c9618c0998169d456"
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
