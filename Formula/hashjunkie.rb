class Hashjunkie < Formula
  desc "Multi-algorithm file hasher"
  homepage "https://github.com/Tuxie/HashJunkie"
  license "MIT"

  release_version = "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-arm64.tar.xz"
      sha256 "488e1771d0927f0bf6f493a3120dce11c6a0ac08692797a6077c9d25431149fb"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-darwin-x64.tar.xz"
      sha256 "12ce36998aaa8bbddf8d0fcad464064e25d793487757795225f0b52fa2d0c91e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-arm64-gnu.tar.xz"
      sha256 "21799939686268d4bb8f1ec808b1a1a85a0aa36830cafb4231bf9f51649b8738"
    end
    on_intel do
      url "https://github.com/Tuxie/HashJunkie/releases/download/v#{release_version}/hashjunkie-cli-#{release_version}-linux-x64-gnu.tar.xz"
      sha256 "30c6ce567b4052b70e996cb7a2555fa9647f8a09f4da5170b30c5b28b0ab06a8"
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
