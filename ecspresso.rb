class Ecspresso < Formula
  version '0.15.3'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.15.3/ecspresso-v0.15.3-darwin-amd64"
  sha256 '96b5e2c984bf1bc97b94009646b2ff4406a072e1b236997702207bdd0beadd04'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.15.3-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
