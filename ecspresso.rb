class Ecspresso < Formula
  version '0.17.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.17.0/ecspresso-v0.17.0-darwin-amd64"
  sha256 '5928d31a3616b6137e81d57c537fc3ffac6aa5da540b1cb5d17a88b4c04d9972'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.17.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
