class Ecspresso < Formula
  version '1.6.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.0/ecspresso_1.6.0_darwin_amd64.tar.gz"
    sha256 '39b9849006bc9c3fd1db66245cb10accad7f2bf3d13420c8bf4e750f418ffa76'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.0/ecspresso_1.6.0_linux_amd64.tar.gz"
    sha256 '04216bff2cca039a498068ce47f3b6d94198b30e4ecc6e7a71e996da5fd90831'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecspresso'
  end
end
