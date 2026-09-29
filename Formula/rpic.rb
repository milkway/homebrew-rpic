class Rpic < Formula
  desc "pic graphics language rendered to SVG/PNG/PDF"
  homepage "https://github.com/milkway/rpic-lang"
  version "0.11.3"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-aarch64-apple-darwin.tar.gz"
      sha256 "cffb9a2dbc6803730bef39c7ef8087f2ae46bc0eaf6d18f3498f6448c57eae41"
    end
    on_intel do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-apple-darwin.tar.gz"
      sha256 "5724cba31755d700ce44b4bd6704361d8cf088293647795aaa3ccf4a79ea93e6"
    end
  end

  on_linux do
    url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "68d90c5213cf96b675a07bc2f9eabd3a980a908615bb2a21c274270c682ec32e"
  end

  def install
    bin.install "rpic"
  end

  test do
    (testpath/"a.pic").write('box "x"')
    assert_match "<svg", shell_output("#{bin}/rpic #{testpath}/a.pic")
  end
end
