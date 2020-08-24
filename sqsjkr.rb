class Sqsjkr < Formula
  version '0.3.2'
  homepage 'https://github.com/kayac/sqsjkr'
  if OS.mac?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.3.2/sqsjkr-v0.3.2-darwin-amd64.tar.gz"
    sha256 '974b31ecb354a0e854b0a158c9f88d60229b23a375b6f553300758f120eb8681'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.3.2/sqsjkr-v0.3.2-linux-amd64.tar.gz"
    sha256 'c81b8ee40a65b9e88b6ae1123ce7a07b8f4ae13eac28f248d0f787bdcd030b2b'
  end
  head 'https://github.com/kayac/sqsjkr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    system 'mv sqsjkr-v*-*-amd64 sqsjkr'
    bin.install 'sqsjkr'
  end
end
