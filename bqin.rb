class Bqin < Formula
  version '0.3.1'
  homepage 'https://github.com/kayac/bqin'
  url "https://github.com/kayac/bqin/releases/download/v0.3.1/bqin-v0.3.1-darwin-amd64"
  sha256 '2ece07c7cec8cfb233d5958adf22a63342955d4b2749dcd745b2fbb3fce645db'
  head 'https://github.com/kayac/bqin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'bqin-v*-darwin-amd64', 'bqin'
    bin.install 'bqin'
  end
end
