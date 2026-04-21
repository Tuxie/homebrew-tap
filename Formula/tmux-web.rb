class TmuxWeb < Formula
  desc "Browser-based tmux frontend"
  homepage "https://github.com/Tuxie/tmux-web"
  version "1.6.3"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-arm64.tar.xz"
      sha256 "990df191b66e013a2c7c7b5ddb84547a89044ce31270475121b69bc04138bcea"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-darwin-x64.tar.xz"
      sha256 "cfe70c05487a4e00a5efcc51c58c57250ef1138cf7b08e2844373733f35316ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-arm64.tar.xz"
      sha256 "bacb397ae5db38b558993514c5236166f80127d8e1ef8b5e4cbc02ae606aacce"
    end
    on_intel do
      url "https://github.com/Tuxie/tmux-web/releases/download/v#{version}/tmux-web-v#{version}-linux-x64.tar.xz"
      sha256 "b8460cb04ac162c5eb3f5b7f0b987c24d043e78dff88d634fa7bfe4bfd6fc0b8"
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
