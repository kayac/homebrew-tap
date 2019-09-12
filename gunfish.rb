class Gunfish < Formula
  version '0.3.3'
  homepage 'https://github.com/kayac/Gunfish'
  url "https://github.com/kayac/Gunfish/releases/download/v0.3.3/gunfish-v0.3.3-darwin-amd64.zip"
  sha256 '4c30902d4cc6d04be99157b352656358bd8187c130676ba888fb0da96c0183d1'
  head 'https://github.com/kayac/Gunfish.git'

  def install
    system 'mv', 'gunfish-v0.3.3-darwin-amd64', 'gunfish'
    bin.install 'gunfish'
  end
end
