class Gunfish < Formula
  version '0.4.0'
  homepage 'https://github.com/kayac/gunfish'
  url "https://github.com/kayac/Gunfish/releases/download/v0.4.0/gunfish-v0.4.0-darwin-amd64"
  sha256 '4390c7f1c1a196b15440548a73cd864bade671e34129ab84fcbd5554fdba2b1d'
  head 'https://github.com/kayac/gunfish.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv', 'gunfish-v*-darwin-amd64', 'gunfish'
    bin.install 'gunfish'
  end
end
