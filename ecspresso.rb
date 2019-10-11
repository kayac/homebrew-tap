class Ecspresso < Formula
  version '0.11.1'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.11.1/ecspresso-v0.11.1-darwin-amd64.zip"
  sha256 '1580935055ebe09b72553c60ad756346f6fcd6d4a54148edeba376f372167801'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    system 'mv', 'ecspresso-v0.11.1-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
