class Ecspresso < Formula
  version '0.13.2'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.2/ecspresso-v0.13.2-darwin-amd64"
  sha256 '803abfce3105c9fc465e571fc2203c4f4ad13235c304f1b4c6b95cdc2f88af24'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.2-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
