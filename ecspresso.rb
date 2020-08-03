class Ecspresso < Formula
  version '0.17.2'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.17.2/ecspresso-v0.17.2-darwin-amd64"
  sha256 '348a69aa1a12117de6e85ff2e025fcc80567c451db9481134871914ae46d0edd'
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
