class Ecspresso < Formula
  version '0.11.1'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.11.1/ecspresso-v0.11.1-darwin-amd64.zip"
  sha256 '3e12eeb87b887f71f96250cdd37f54dfbfc558957e4afa43d627c481c150358b'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.11.1-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
