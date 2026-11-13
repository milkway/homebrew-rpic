class Rpic < Formula
  desc "pic graphics language rendered to SVG/PNG/PDF"
  homepage "https://github.com/milkway/rpic-lang"
  version "0.19.1"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-aarch64-apple-darwin.tar.gz"
      sha256 "49924fb3148b1ecc5f5235f68d02620e50821abe6e2f225a291104b667cb30d4"
    end
    on_intel do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-apple-darwin.tar.gz"
      sha256 "8df2cd1380daa2137882aa38b1928ff0672eee76b4de8741492fbc066f89b11c"
    end
  end

  on_linux do
    url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-unknown-linux-musl.tar.gz"
    sha256 "92f5d2a3f41f86af4691f20877fa56c7f1a4f0e94779ccd8a102a26242e21ab1"
  end

  def install
    bin.install "rpic"
  end

  test do
    (testpath/"a.pic").write('box "x"')
    assert_match "<svg", shell_output("#{bin}/rpic #{testpath}/a.pic")
  end
end
