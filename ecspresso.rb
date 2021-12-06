class Ecspresso < Formula
  version '1.7.2'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.2/ecspresso_1.7.2_darwin_amd64.tar.gz"
    sha256 'f2ef37ad8f5d4324d7195dcde7984717272147ec2740d0fdbf0a4aee6cb4d579'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.2/ecspresso_1.7.2_linux_amd64.tar.gz"
    sha256 '78f082bcfa6af16c39ffb21e8f726ff7d65051192797bb20595638a4ef44280c'
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
