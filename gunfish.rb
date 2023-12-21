class Gunfish < Formula
  version '0.5.0'
  homepage 'https://github.com/kayac/gunfish'
  if OS.mac?
    url "https://github.com/kayac/Gunfish/releases/download/v0.5.0/Gunfish_v0.5.0_darwin_amd64.tar.gz"
    sha256 'be72aba544e951ff16aa73f8ad8714d38333172b92f8d9597ac76f6245dbbe66'
  end
  if OS.linux?
    url "https://github.com/kayac/Gunfish/releases/download/v0.5.0/Gunfish_v0.5.0_linux_amd64.tar.gz"
    sha256 '3ba85fb17b8217f8071dc029e940be61ce0eb60d8ede0043c058b38457cd88be'
  end
  head 'https://github.com/kayac/gunfish.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv gunfish-v*-*-amd64 gunfish'
    bin.install 'gunfish'
  end
end
