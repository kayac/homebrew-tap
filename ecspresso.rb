class Ecspresso < Formula
  version '0.8.1'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.8.1/ecspresso-v0.8.1-darwin-amd64.zip"
  sha256 '9463330d68f5fbf715a63fff8223cbd237bd548ff50f2bba9b80f5805f39f865'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.8.1-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
