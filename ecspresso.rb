class Ecspresso < Formula
  version '1.7.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.0/ecspresso_1.7.0_darwin_amd64.tar.gz"
    sha256 '25b38893b489aed4f49e7045bfdbfb93ab39ee5dfd733d2b9e0bccfc82683fff'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.0/ecspresso_1.7.0_linux_amd64.tar.gz"
    sha256 'ac7f4b2f0e62cc8b83b9c4bfe3302f7797ba56dd224425970d1f7459fc4a161d'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'cmd/ecspresso/ecspresso'
      system 'mv', 'cmd/ecspresso/ecspresso', '.'
    end
    bin.install 'ecspresso'
  end
end
