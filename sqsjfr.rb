class Sqsjfr < Formula
  version '0.0.3'
  homepage 'https://github.com/kayac/sqsjfr'
  if OS.mac?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.3/sqsjfr_0.0.3_darwin_amd64.tar.gz"
    sha256 '189e54870de5664293c5cdc68bd63055d8bdbaa0a7aa947d58faebc5ebce8021'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.3/sqsjfr_0.0.3_linux_amd64.tar.gz"
    sha256 '471691463a6b3570e95182bf734f95870cb276a291a0cad8d8b5967a3df12ef3'
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
