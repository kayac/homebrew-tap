class Gunfish < Formula
  version '0.7.0'
  homepage 'https://github.com/kayac/gunfish'
  if OS.mac?
    url "https://github.com/kayac/Gunfish/releases/download/v0.7.0/Gunfish_v0.7.0_darwin_amd64.tar.gz"
    sha256 '8956e4ab4f2fceb5c1cdc512a8a1bc5da2ec2654d0566e45760f47638cad966d'
  end
  if OS.linux?
    url "https://github.com/kayac/Gunfish/releases/download/v0.7.0/Gunfish_v0.7.0_linux_amd64.tar.gz"
    sha256 '339815f1d395686b7601d413d3ef54571df306d30c835532c15573c47065f23b'
  end
  head 'https://github.com/kayac/gunfish.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gunfish'
  end
end
