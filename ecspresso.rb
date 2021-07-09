class Ecspresso < Formula
  version '1.5.8'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.8/ecspresso-v1.5.8-darwin-amd64.zip"
    sha256 '2b1c697c92342a4d9305332575c320d3ee92a90cf5fdf7cda6a26fbed4bf9fd9'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.8/ecspresso-v1.5.8-linux-amd64.zip"
    sha256 '25342b3083e76dd213eaa0a94b458245bcb88e8b66705381c71e71f7d7f360a3'
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
