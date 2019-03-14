class Gunfish < Formula
  version '0.3.1'
  homepage 'https://github.com/kayac/Gunfish'
  url "https://github.com/kayac/Gunfish/releases/download/v0.3.1/gunfish-v0.3.1-darwin-amd64.zip"
  sha256 '48a5ef25559d89cce2f49d20cb4c84c142f700dffcc0715ac6dbe82c80a2f0e2'
  head 'https://github.com/kayac/Gunfish.git'

  def install
    system 'mv', 'gunfish-v0.3.1-darwin-amd64', 'gunfish'
    bin.install 'gunfish'
  end
end
