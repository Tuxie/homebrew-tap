class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.8.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "f90958e5b38e9e8b0f0e99c223745348ed58af6673b9fbdcd4a34b5ef3430d92"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "aa07994bcbf8cd0c14f69edc01af46d6a00c8cfadaadada481c5b17da3c95496"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "2f59d5178aef7f1018acb24eac74077f62da226dfce03e856a76d16120180652"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "00199f8c255d60b8dc2bb96bc4de213078282a4514d4bf6c7bafc3e15ca3c53f"
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
