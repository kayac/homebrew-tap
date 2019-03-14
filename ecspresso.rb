class Ecspresso < Formula
  version '0.7.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.7.0/ecspresso-v0.7.0-darwin-amd64"
  sha256 'af177c0b8a977c9c20447ffbe1e6b92b2accb427552e41ec64783ff88e06ab99'
  head 'https://github.com/kayac/ecspresso.git'

  def install
    bin.install 'ecspresso'
  end
end
