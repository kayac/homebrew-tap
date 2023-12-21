class Katsubushi < Formula
  desc 'ID generator server'
  version '2.0.3'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.3/go-katsubushi_v2.0.3_darwin_arm64.tar.gz'
      sha256 '3c6f817c44b18adf97cd22727783950cc5738d9dc2061c0bb5edf5e1bce180d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.3/go-katsubushi_v2.0.3_darwin_amd64.tar.gz'
      sha256 '02a5deb75cc93287bd44c3c00322b644693f5faeb4cb15b67ffef54adb889d48'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.3/go-katsubushi_v2.0.3_linux_arm64.tar.gz'
      sha256 '570bf7da028d5c4fd8de3b19fc75d587a1f51d2b1f3c085fbd0d2235e969e194'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.3/go-katsubushi_v2.0.3_linux_amd64.tar.gz'
      sha256 '20f2f6239ff83f651970f769d72f6024105b46034130e09494acbc7ff84ebf67'
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
