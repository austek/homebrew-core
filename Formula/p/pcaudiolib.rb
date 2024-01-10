class Pcaudiolib < Formula
  desc "Portable C Audio Library"
  homepage "https://github.com/espeak-ng/pcaudiolib"
  url "https://github.com/espeak-ng/pcaudiolib/releases/download/1.2/pcaudiolib-1.2.tar.gz"
  sha256 "6fae11e87425482acbb12c4e001282d329be097074573060f893349255d3664b"
  license "GPL-3.0-only"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build

  def install
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
