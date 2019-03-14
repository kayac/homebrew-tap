class Sqsjkr < Formula
  version '0.3.2'
  homepage 'https://github.com/kayac/sqsjkr'
  url "https://github.com/kayac/sqsjkr/releases/download/v0.3.2/sqsjkr-v0.3.2-darwin-amd64"
  sha256 '083f1490a7ce4ab4567ce12f1bbe1edb6ac611afed7db50bae29d24d7c5a0ce5'
  head 'https://github.com/kayac/sqsjkr.git'

  def install
    system 'mv', 'sqsjkr-v0.3.2-darwin-amd64', 'sqsjkr'
    bin.install 'sqsjkr'
  end
end
