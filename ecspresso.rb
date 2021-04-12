class Ecspresso < Formula
  version '1.5.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.0/ecspresso-v1.5.0-darwin-amd64.zip"
    sha256 'b756b52700aca21d1d56109182366d44476963e1ffe2dbb362193fd1f99e98bc'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.0/ecspresso-v1.5.0-linux-amd64.zip"
    sha256 '417c847915e9f435b2914cfe6e08a6dc8cdca142910fa8a8876e17f692af8e1c'
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
