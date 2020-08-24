class Bqin < Formula
  version '0.3.1'
  homepage 'https://github.com/kayac/bqin'
  if OS.mac?
    url "https://github.com/kayac/bqin/releases/download/v0.3.1/bqin-v0.3.1-darwin-amd64.zip"
    sha256 'bbdb9c45fc8e275005214eff31f28340256d189a8bef6916e7ebfad3542371ae'
  end
  if OS.linux?
    url "https://github.com/kayac/bqin/releases/download/v0.3.1/bqin-v0.3.1-linux-amd64.zip"
    sha256 '2054684e3b8177da7f52b1ae5aadeef05a4a8fb96fd3ec49e6897a81dcda4660'
  end
  head 'https://github.com/kayac/bqin.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv bqin-v*-*-amd64 bqin'
    bin.install 'bqin'
  end
end
