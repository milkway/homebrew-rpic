class Rpic < Formula
  desc "pic graphics language rendered to SVG/PNG/PDF"
  homepage "https://github.com/milkway/rpic-lang"
  version "0.16.1"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-aarch64-apple-darwin.tar.gz"
      sha256 "7617af5918e63842ebfed0873a00d5f651b1f88155375d2b8776f7529569cfdb"
    end
    on_intel do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-apple-darwin.tar.gz"
      sha256 "27853680eba661770cf193d37e6e15ade9021d7a25574644f3334a16a250a36d"
    end
  end

  on_linux do
    url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7c4e720d5088d142c6ecb00f42991d8db92fce7083272c5ea80974b3575fb321"
  end

  def install
    bin.install "rpic"
  end

  test do
    (testpath/"a.pic").write('box "x"')
    assert_match "<svg", shell_output("#{bin}/rpic #{testpath}/a.pic")
  end
end
