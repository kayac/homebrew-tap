class Ecspresso < Formula
  version '1.1.2'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.2/ecspresso-v1.1.2-darwin-amd64.zip"
    sha256 'da4f3881d7e066a43673146a7d0ca94977e949c2cfc164f9d45df96826945fcb'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.2/ecspresso-v1.1.2-linux-amd64.zip"
    sha256 '27779bba66d2dd31cc2cb5d909f28263d60b1c7b0d1debeed924e2cf21262b60'
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
