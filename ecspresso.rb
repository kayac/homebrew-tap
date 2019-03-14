class Ecspresso < Formula
  version '0.7.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.7.0/ecspresso-v0.7.0-darwin-amd64.zip"
  sha256 '1245ef841af189679958ff2d773af6bac13a2507fc4fbc2e9fdde9031e85427f'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.7.0-darwin-amd64', 'escpresso'
    bin.install 'ecspresso'
  end
end
