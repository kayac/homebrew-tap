class Ecspresso < Formula
  version '0.9.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.9.0/ecspresso-v0.9.0-darwin-amd64.zip"
  sha256 '9126d889b103c4d31e3fe94b82708b0bd2029592568ad69fdd80599734d2889a'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.9.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
