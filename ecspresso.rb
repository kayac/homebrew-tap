class Ecspresso < Formula
  version '0.16.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.16.0/ecspresso-v0.16.0-darwin-amd64"
  sha256 'a6825ffb948cae57f4ec5301998b67329b3179d1d91e7584e695b32e6fd9c6ee'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.16.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
