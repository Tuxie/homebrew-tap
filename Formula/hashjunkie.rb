class Hashjunkie < Formula
  desc "Multi-algorithm file hasher"
  homepage "https://github.com/Tuxie/HashJunkie"
  license "MIT"

  release_version = "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-arm64.tar.xz"
      sha256 "348a7c3c9426a899ece91cd125dde8bcf211c87f8c54c3579f4d7841ed725c0e"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-x64.tar.xz"
      sha256 "159efc044c1e3e5f3ba54b895e1399abcbd1818f5a2c97b92efc66e881c8ad06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-arm64-gnu.tar.xz"
      sha256 "1556a8df94f127cdef1d594442b592e5c9c6e9460489757f8ab1eddbb6d07665"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-x64-gnu.tar.xz"
      sha256 "93fe22dd21a2e3e8b9fed80c5366927aa1b54e4ff0ceb28787f5a4c7cb432e4a"
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
