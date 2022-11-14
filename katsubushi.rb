class Katsubushi < Formula
  desc 'ID generator server'
  version '2.0.0'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_darwin_arm64.tar.gz'
      sha256 '8a80af6a52d5d894f548fcf1042c9f0f6cf52cce427b1be89c8d3a9870c98d79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_darwin_amd64.tar.gz'
      sha256 '72edd1580ac0f5613582b773c11d4d48aaeb9ce1b451a04c07e576ecd7ae5fc7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_linux_arm64.tar.gz'
      sha256 '8396d9123c63030903886396a14528760b49607ea97c87cf8b4b82b9ecaec063'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.0/go-katsubushi_v2.0.0_linux_amd64.tar.gz'
      sha256 'afd7f3e020bfd7949d70b44e549c81ded742f5333a069dd3cf03d659827e6bd0'
    end
  end

  head do
    url 'https://github.com/kayac/go-katsubushi.git'
    depends_on 'go' => :build
  end

  def install
    bin.install 'katsubushi'
  end
end
