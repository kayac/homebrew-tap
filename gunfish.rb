class Gunfish < Formula
  version '0.4.1'
  homepage 'https://github.com/kayac/gunfish'
  url "https://github.com/kayac/Gunfish/releases/download/v0.4.1/gunfish-v0.4.1-darwin-amd64"
  sha256 '9d57ff030bf2bbdabb0779bff410499c1d26b53a65fb5578936047a4cf4020e5'
  head 'https://github.com/kayac/gunfish.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv gunfish-v*-darwin-amd64 gunfish'
    bin.install 'gunfish'
  end
end
