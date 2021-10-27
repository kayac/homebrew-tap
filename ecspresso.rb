class Ecspresso < Formula
  version '1.6.2'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.2/ecspresso_1.6.2_darwin_amd64.tar.gz"
    sha256 '887a95bd724c36837480a95982ac4293d971e848751494831b1295992a168dbb'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.2/ecspresso_1.6.2_linux_amd64.tar.gz"
    sha256 'beb7bf5e3bc335344a56df37d0203de1518a3ddf7630f150e2857998b0a4454d'
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
