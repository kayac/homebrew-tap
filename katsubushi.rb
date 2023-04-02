class Katsubushi < Formula
  desc 'ID generator server'
  version '2.0.1'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.1/go-katsubushi_v2.0.1_darwin_arm64.tar.gz'
      sha256 '45091e213b45db160ec715f6364643adb328f81f625a4f12df7bc9663d43578d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.1/go-katsubushi_v2.0.1_darwin_amd64.tar.gz'
      sha256 '5a6544eff2ecef6d23fec720792e2da2dbfd1aae3d9339418ad94f5cbd5edcd2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.1/go-katsubushi_v2.0.1_linux_arm64.tar.gz'
      sha256 '4236f3c65d7d7b179cca2bea073b6f98db3990a8813034643ab817774e8cd973'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.1/go-katsubushi_v2.0.1_linux_amd64.tar.gz'
      sha256 'fb7eca25f1ec8a5b7edb789dd610851097b6fe15f0188ffef26b4f4490f611a1'
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
