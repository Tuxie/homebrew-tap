class Hashjunkie < Formula
  desc "Multi-algorithm file hasher"
  homepage "https://github.com/Tuxie/HashJunkie"
  license "MIT"

  release_version = "0.5.0"
  version release_version

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-arm64.tar.xz"
      sha256 "5212ba3d9ed3846ea30cbfb624428b0dc76f647d3a3ce9c2f4f32b3980f86542"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-x64.tar.xz"
      sha256 "d62c9cadc6b89008ed23aee17112082215f0130130c9603cda127fa89e1f79e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-arm64-gnu.tar.xz"
      sha256 "30c5ae24e27cbe4333c62667e3d022ee656415a7fa29f7de09f210884545689f"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-x64-gnu.tar.xz"
      sha256 "9944bab54366b8f54259f746051f77f981d8550910e11df65fc4d91006d56321"
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
