class EspeakNg < Formula
  desc "Multi-lingual software speech synthesizer"
  homepage "https://github.com/espeak-ng/espeak-ng"
  url "https://github.com/espeak-ng/espeak-ng/archive/refs/tags/1.51.1.tar.gz"
  sha256 "0823df5648659dcb67915baaf99118dcc8853639f47cadaa029c174bdd768d20"
  license "GPL-3.0-only"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on xcode: :build
  depends_on "pcaudiolib"

  patch do
    url "https://raw.githubusercontent.com/austek/formula-patches/e3cb416/espeak-ng/1.51.1.patch"
  end

  def install
    mv "CHANGELOG.md", "ChangeLo.md"
    mv "ChangeLo.md", "ChangeLog.md"
    system "./autogen.sh"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    assert_equal "h@l'oU\n", shell_output("#{bin}/espeak-ng -qx hello")
  end
end
