class Ecspresso < Formula
  version '1.7.5'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.5/ecspresso_1.7.5_darwin_amd64.tar.gz"
    sha256 '6123dd2637492ecb45c296befbfb4365d27df68f03ed666898ed703d5e08a092'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.5/ecspresso_1.7.5_linux_amd64.tar.gz"
    sha256 '71a3455a902e86fa221dbcdef7553c1bf753da78f9a7917f254039d735a81ee5'
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
