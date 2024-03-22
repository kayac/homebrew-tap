class Katsubushi < Formula
  desc 'ID generator server'
  version '2.0.4'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.4/go-katsubushi_v2.0.4_darwin_arm64.tar.gz'
      sha256 '79288a6ea4dde020db16b1020708558455bfbd6064d1f96ffe8b708e1f61fe6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.4/go-katsubushi_v2.0.4_darwin_amd64.tar.gz'
      sha256 'cb7e24ca0888409d0a663a151f13d0ab418bb14015098c0e679ae830c6101a86'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.4/go-katsubushi_v2.0.4_linux_arm64.tar.gz'
      sha256 '913d27a1dac4dca511e85820bbccbba07266b408bebf1f08d3112b615da289e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.4/go-katsubushi_v2.0.4_linux_amd64.tar.gz'
      sha256 'c3e277918dcfe13182459911c33c5047d3858af023a2dff103303fc3e1702cf6'
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
