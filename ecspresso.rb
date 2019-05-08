class Ecspresso < Formula
  version '0.7.1'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.7.1/ecspresso-v0.7.1-darwin-amd64.zip"
  sha256 '64d3a00856b6af128011193bb933ce91b898639c324598463c670cacd76022fd'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.7.1-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
