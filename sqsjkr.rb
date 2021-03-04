class Sqsjkr < Formula
  version '0.5.1'
  homepage 'https://github.com/kayac/sqsjkr'
  if OS.mac?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.5.1/sqsjkr_0.5.1_darwin_amd64.tar.gz"
    sha256 'daed16db545bb30d073f7a02781c2c6ed2dbb91920e9bdd701e6a5c39b62457a'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.5.1/sqsjkr_0.5.1_linux_amd64.tar.gz"
    sha256 '2aeed73758c9899d62640810c859f7fc42edbfd3bd4bcde62ecacb2e2494661b'
  end
  head 'https://github.com/kayac/sqsjkr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'sqsjkr'
  end
end
