class Hashjunkie < Formula
  desc "Multi-algorithm file hasher"
  homepage "https://github.com/Tuxie/HashJunkie"
  license "MIT"

  release_version = "0.5.2"
  version release_version

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-arm64.tar.xz"
      sha256 "adbd4fc4b15e216cfb846df3b930298b5492fcb9625567583ddcc0614faa59e6"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-x64.tar.xz"
      sha256 "5609e46e8209bc9c5226277bc0f792da6d85f7e4a7bc3826331bdb528cb3b411"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-arm64-gnu.tar.xz"
      sha256 "71ba369c7fc68137e7a50f55d6325c7c15d41a15dcd70d3b1f60c0583c3bceb4"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-x64-gnu.tar.xz"
      sha256 "31fe2f1710fe949a5b7086910ac32006cf0778848bf132e9f04e660d151083cc"
    end
  end

  def install
    bin.install "hashjunkie"
  end

  test do
    output = pipe_output("#{bin}/hashjunkie -a sha256 --format hex", "abc")
    assert_match "sha256: ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", output
  end
end
