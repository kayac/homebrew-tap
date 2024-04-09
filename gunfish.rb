class Gunfish < Formula
  version '0.6.0'
  homepage 'https://github.com/kayac/gunfish'
  if OS.mac?
    url "https://github.com/kayac/Gunfish/releases/download/v0.6.0/Gunfish_v0.6.0_darwin_amd64.tar.gz"
    sha256 '65728f0ef344f62f99a092112522f728f1924b8315607aa52af81334fa064c89'
  end
  if OS.linux?
    url "https://github.com/kayac/Gunfish/releases/download/v0.6.0/Gunfish_v0.6.0_linux_amd64.tar.gz"
    sha256 '013c758ab9891c29947a1e3e6d06f0f93ecef71a5b1d4391a7ffb2cea5803deb'
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
