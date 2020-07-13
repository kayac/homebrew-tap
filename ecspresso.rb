class Ecspresso < Formula
  version '0.17.1'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.17.1/ecspresso-v0.17.1-darwin-amd64"
  sha256 'eeb2dfb0f0a0b0368638b15bb2b67e1f45b6a8b6cbc9c5f1813535147becc6cc'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.17.1-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
