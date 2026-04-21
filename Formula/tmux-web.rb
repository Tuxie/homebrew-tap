class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.6.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "1988bfc68ae702ae2abc32fe8bd3f50a6864f3534a43fa4a72fbd505a192a5e5"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "c23216f69964d9b50313ff13d43eb13acbfe66982da132fcbb103cc511f4b7e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "7cdff2f571c6c85658148779f8062b7c76f807843ce53adb1b551075adafa54d"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "21c8cf6cf026517acad1cd3f064a87f666b3cbf9a7b588fba9e7725faabd12f3"
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
