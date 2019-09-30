class Ecspresso < Formula
  version '0.10.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.10.0/ecspresso-v0.10.0-darwin-amd64.zip"
  sha256 'a343c5df7f4b5ee74522bc2db21258e5bb898f5e1c255dccd539af2246e04929'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.10.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
