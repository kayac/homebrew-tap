class Sqsjfr < Formula
  version '0.0.2'
  homepage 'https://github.com/kayac/sqsjfr'
  if OS.mac?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.2/sqsjfr_0.0.2_darwin_amd64.tar.gz"
    sha256 'de5604f1313d6e0dbbdeebf1413a87c1a55451b1cc79dceddfd640436dc29470'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.2/sqsjfr_0.0.2_linux_amd64.tar.gz"
    sha256 '6f4d8ec04f758980943ddaaf02c513c4a25ebbba3ac7d3e9fe395c40471665c9'
  end
  head 'https://github.com/kayac/sqsjfr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
    end
    bin.install 'sqsjfr'
  end
end
