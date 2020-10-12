class Sqsjkr < Formula
  version '0.4.0'
  homepage 'https://github.com/kayac/sqsjkr'
  if OS.mac?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.4.0/sqsjkr_0.4.0_darwin_amd64.tar.gz"
    sha256 '377fd391fd4136bb6c3a88cfdf0d20f288d79da9f66f6b2080004cbb3e920fae'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.4.0/sqsjkr_0.4.0_linux_amd64.tar.gz"
    sha256 '62bd7ee86e06e269aa969697f0534ee231c750d07693bde37f08163f2b6fc7e8'
  end
  head 'https://github.com/kayac/sqsjkr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'sqsjkr'
  end
end
