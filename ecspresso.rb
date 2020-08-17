class Ecspresso < Formula
  version '0.17.3'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.17.3/ecspresso-v0.17.3-darwin-amd64"
  sha256 '1ac91503dcf2e7883b9df0d2a5b54c7c9a49e2d7b78f73286cfc19bb6ad44778'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv ecspresso-v*-darwin-amd64 ecspresso'
    bin.install 'ecspresso'
  end
end
