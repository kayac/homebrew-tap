class Sqsjfr < Formula
  version '0.1.0'
  homepage 'https://github.com/kayac/sqsjfr'
  if OS.mac?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.1.0/sqsjfr_0.1.0_darwin_amd64.tar.gz"
    sha256 '7ec54998045350185510fdee773aae307baa7de108fddbce4948e3a8e79460e5'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.1.0/sqsjfr_0.1.0_linux_amd64.tar.gz"
    sha256 '87ac46cabb8b1ce4a6bcd19cf6e86638ac36ea0da849b50bdecb1949b8af68e4'
  end
  head 'https://github.com/kayac/sqsjfr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
    end
    bin.install 'sqsjfr'
  end
end
