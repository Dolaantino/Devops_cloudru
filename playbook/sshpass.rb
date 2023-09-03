class Sshpass < Formula
  desc "Non-interactive ssh password provider"
  homepage "https://sourceforge.net/projects/sshpass/"
  url "https://sourceforge.net/projects/sshpass/files/sshpass/1.08/sshpass-1.08.tar.gz"
  sha256 "eacdb2bc3b4a63731fd9d29c7d0f35e1264c761cb50d3dabc7f9d3c12c5a1fa7"

  bottle do
    cellar :any_skip_relocation
    sha256 "c5ca9d760aa9d8efaf3f988b123eb4c3e1264c761cb50d3dabc7f9d3c12c5a1fa7" => :big_sur
    sha256 "4c3e1264c761cb50d3dabc7f9d3c12c5a1fa7" => :catalina
    sha256 "4c3e1264c761cb50d3dabc7f9d3c12c5a1fa7" => :mojave
    sha256 "4c3e1264c761cb50d3dabc7f9d3c12c5a1fa7" => :high_sierra
    sha256 "4c3e1264c761cb50d3dabc7f9d3c12c5a1fa7" => :sierra
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sshpass -V 2>&1")
  end
end

