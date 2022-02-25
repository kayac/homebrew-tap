class Ecspresso < Formula
  version '1.7.8'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.8/ecspresso_1.7.8_darwin_amd64.tar.gz"
    sha256 '52a451aad1695982edd9e4b38fed3cd5723792a7f7a4611de8e63c82a2f24832'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.8/ecspresso_1.7.8_linux_amd64.tar.gz"
    sha256 '3eb6221dc436b93badb37007e66c83603556f339a802118a57b059ffe85b7cde'
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
