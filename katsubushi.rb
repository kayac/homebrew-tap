class Katsubushi < Formula
  desc 'ID generator server'
  version '2.2.0'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.0/go-katsubushi_v2.2.0_darwin_arm64.tar.gz'
      sha256 'fdf4f6faf9740ac1eee55fff8157ba3fec094e52deac670d8b14a7903160e674'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.0/go-katsubushi_v2.2.0_darwin_amd64.tar.gz'
      sha256 '587d7dd8587a788f1b201d58f91f0193498cd30ee3bcd216df90f9137c387077'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.0/go-katsubushi_v2.2.0_linux_arm64.tar.gz'
      sha256 'd37bd40b57b364ccc24d4b1b38ad6300b170e8ed6105e7947b9d7eff34c0d051'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.0/go-katsubushi_v2.2.0_linux_amd64.tar.gz'
      sha256 '6ac61ed6badf692ac1de2912112752f09561ae80b8827faa241a3b112f3f99bd'
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
