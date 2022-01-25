class Ecspresso < Formula
  version '1.7.7'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.7/ecspresso_1.7.7_darwin_amd64.tar.gz"
    sha256 'feee51aa4359d05d4aa274785e0574331af9c2aeb571487a2ab1fc04db1e0e26'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.7/ecspresso_1.7.7_linux_amd64.tar.gz"
    sha256 'c744fdb5413f51d5067c73ce99e84fb61598f7bef9e30cbbb3c5f6b793889c51'
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
