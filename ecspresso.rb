class Ecspresso < Formula
  version '0.13.6'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.6/ecspresso-v0.13.6-darwin-amd64"
  sha256 '7c1addcb0cc89aea5534358dc822fe1fa1f754e45014990e8b74ac5c3d63bc9e'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.6-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
