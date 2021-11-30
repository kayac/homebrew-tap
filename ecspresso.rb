class Ecspresso < Formula
  version '1.7.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.1/ecspresso_1.7.1_darwin_amd64.tar.gz"
    sha256 'e56782c80526aaf8cbd9953cb9942acd717fd9905503aef48c4f6fda51bc9de2'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.1/ecspresso_1.7.1_linux_amd64.tar.gz"
    sha256 '89cfad47fb916df10c2fe05bb7db1d541aa438aaf6db569a9616d97481a7f6cd'
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
