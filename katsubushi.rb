class Katsubushi < Formula
  version '2.0.0'
  homepage 'https://github.com/kayac/go-katsubushi'
  if OS.mac?
    url "https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_darwin_amd64.tar.gz"
    sha256 '72edd1580ac0f5613582b773c11d4d48aaeb9ce1b451a04c07e576ecd7ae5fc7'
  end
  if OS.linux?
    url "https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_linux_amd64.tar.gz"
    sha256 'afd7f3e020bfd7949d70b44e549c81ded742f5333a069dd3cf03d659827e6bd0'
  end
  head 'https://github.com/kayac/go-katsubushi.git'

  def install
    bin.install 'katsubushi'
  end
end
