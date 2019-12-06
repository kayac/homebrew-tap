class Ecspresso < Formula
  version '0.13.3'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.3/ecspresso-v0.13.3-darwin-amd64"
  sha256 '2a8138511a4ee321f0e1d1574aecb3daf3e097baa899c05d71154937033e7240'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.3-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
