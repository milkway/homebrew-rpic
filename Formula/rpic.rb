class Rpic < Formula
  desc "pic graphics language rendered to SVG/PNG/PDF"
  homepage "https://github.com/milkway/rpic-lang"
  version "0.15.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-aarch64-apple-darwin.tar.gz"
      sha256 "1e98af4083662cf47f6eaead9bad7a0d0830b746593df480415d7a42ad27a4e6"
    end
    on_intel do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-apple-darwin.tar.gz"
      sha256 "523e4e4f792129ea6956a6da29dfddba9dceb02b2c474d29cc942a214206e93a"
    end
  end

  on_linux do
    url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e14f957cbca6c73a9210e745d09b43a5ad927ca1915094e0a51f2b6ea33517b1"
  end

  def install
    bin.install "rpic"
  end

  test do
    (testpath/"a.pic").write('box "x"')
    assert_match "<svg", shell_output("#{bin}/rpic #{testpath}/a.pic")
  end
end
