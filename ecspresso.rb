class Ecspresso < Formula
  version '0.12.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.12.0/ecspresso-v0.12.0-darwin-amd64.zip"
  sha256 '4967afede68fc4589c85cd43777a631522a904666703721322c48fbaed6c2c01'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.12.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
