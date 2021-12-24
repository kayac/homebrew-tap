class Ecspresso < Formula
  version '1.7.4'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.4/ecspresso_1.7.4_darwin_amd64.tar.gz"
    sha256 'a02d07180968a8da81a0a39704be2a0ebea07dd7e7c7668be67ea14a7a81237b'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.4/ecspresso_1.7.4_linux_amd64.tar.gz"
    sha256 '64c33d61b1b19ea5e87440a0bb1c5980d6b7d2377e4072ab797c22512a6bbd2c'
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
