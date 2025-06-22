class Katsubushi < Formula
  desc 'ID generator server'
  version '2.1.0'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.1.0/go-katsubushi_v2.1.0_darwin_arm64.tar.gz'
      sha256 '977851543c492ec71d78b058eb98bb4548d4d0a729203f372b133cbc29176f7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.1.0/go-katsubushi_v2.1.0_darwin_amd64.tar.gz'
      sha256 '4c6f76a508033e0d6b2ff1ccc98057f397730632b8ffeb15df8f91ca7c2a9a40'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.1.0/go-katsubushi_v2.1.0_linux_arm64.tar.gz'
      sha256 'f9a19589cb801065d31ca157ac045a0efe029251f0091eacb493615756e45057'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.1.0/go-katsubushi_v2.1.0_linux_amd64.tar.gz'
      sha256 'da9f4640235d8f6af23d8d2d4e1e710e546e177e0dffe0e2b4fc1223e9fd4ca9'
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
