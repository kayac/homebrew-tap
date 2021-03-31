class Ecspresso < Formula
  version '1.4.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.4.0/ecspresso-v1.4.0-darwin-amd64.zip"
    sha256 '66e78290dd8df312ff09063c735f9909fdb6ded41694283db977b0662de23af9'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.4.0/ecspresso-v1.4.0-linux-amd64.zip"
    sha256 'ffb8bff2183776b8512fc6b3a27012183058d1cb4bdfa6285f030234a9b53f8e'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv ecspresso-v*-*-amd64 ecspresso'
    bin.install 'ecspresso'
  end
end
