class Ecspresso < Formula
  version '0.13.5'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.5/ecspresso-v0.13.5-darwin-amd64"
  sha256 '892aaf41a1c91ae9c498e1d8d51c21d1185243020c974522c8dd12b8b18f1ee9'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.5-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
