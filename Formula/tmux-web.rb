class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.9.0-beta1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "07acf588bbfa38b4eacc20619b220186df98af0ef3a5a224a79e32c873355796"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "89c431994027cbe2e83b397074797204a1cc683fe4af96ece8d44ddf7174d026"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "07dafbcce8ad6008e275decbd326a5f285f9b99c5edca7d0be1cce920d6fc815"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "e35b53b1d08cefab3dbe4b9cf91b25df97de9a0ef9aa9780882055db2de9f655"
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
