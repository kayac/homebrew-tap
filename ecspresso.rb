class Ecspresso < Formula
  version '0.13.4'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.4/ecspresso-v0.13.4-darwin-amd64"
  sha256 'd2772578cfaf9d716a9502ac622490d2e584eec444b820f9b516f81f9f9286da'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.4-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
