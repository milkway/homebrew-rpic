class Rpic < Formula
  desc "pic graphics language rendered to SVG/PNG/PDF"
  homepage "https://github.com/milkway/rpic-lang"
  version "0.13.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-aarch64-apple-darwin.tar.gz"
      sha256 "42e5ced6849b28ae206c7b83fe726c8f510ae865e78db76ee94b9d1c436d8461"
    end
    on_intel do
      url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-apple-darwin.tar.gz"
      sha256 "a3dfddb7e8d5e692f383b1da7845bb48a7c62ea3c9095156c087e63955600017"
    end
  end

  on_linux do
    url "https://github.com/milkway/rpic-lang/releases/download/v#{version}/rpic-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ab9716ee52cee46bc0377d14377cdeaa71d181441b6e88a4f267a74321730ac8"
  end

  def install
    bin.install "rpic"
  end

  test do
    (testpath/"a.pic").write('box "x"')
    assert_match "<svg", shell_output("#{bin}/rpic #{testpath}/a.pic")
  end
end
