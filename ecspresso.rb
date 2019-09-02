class Ecspresso < Formula
  version '0.8.2'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.8.2/ecspresso-v0.8.2-darwin-amd64.zip"
  sha256 '5d85b9faf04f8a4623bd17c431669f1c060478b5a28d2395c867616b1cf90bf2'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.8.2-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
