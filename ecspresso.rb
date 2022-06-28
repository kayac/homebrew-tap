class Ecspresso < Formula
  version '1.7.12'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.12/ecspresso_1.7.12_darwin_amd64.tar.gz"
    sha256 'dc30ed2a38550be04a4edc9c274f41afb6b894a5659bab3f552bd1387b525841'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.12/ecspresso_1.7.12_linux_amd64.tar.gz"
    sha256 '3cc163ce213b4870b72c76b6a52ac34232494e2f11863e10155bc1a21da547e9'
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
