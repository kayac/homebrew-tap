class Ecspresso < Formula
  version '1.2.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.2.1/ecspresso-v1.2.1-darwin-amd64.zip"
    sha256 '47e6a8e042de8d9723ef123c39afd7c8305493a9ee5bd26355fc716a13b86972'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.2.1/ecspresso-v1.2.1-linux-amd64.zip"
    sha256 '8e48fddf257893c0ea34eb64f3d9008e0f944dda4af2cb8f208bc2261fc9e1a8'
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
