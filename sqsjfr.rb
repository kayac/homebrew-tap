class Sqsjfr < Formula
  version '0.0.1'
  homepage 'https://github.com/kayac/sqsjfr'
  if OS.mac?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.1/sqsjfr_0.0.1_darwin_amd64.tar.gz"
    sha256 'cab217486992711605b03d701daf087ee373675d5f9090af56a5310c890a0314'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.1/sqsjfr_0.0.1_linux_amd64.tar.gz"
    sha256 '2131d3d60bc55e385ed3dae708f7b8f827acf2131cf8aab20fe14d22e1403c0a'
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
