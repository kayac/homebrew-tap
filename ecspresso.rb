class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.7.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.0/ecspresso_2.7.0_darwin_arm64.tar.gz'
      sha256 '914abdc2cdd81fab6bb441ad9209a86f705a0b01415a15bd6290b033a111914b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.0/ecspresso_2.7.0_darwin_amd64.tar.gz'
      sha256 '788c64dab0fafaaae4a8f647fdc08488b831e99a0ea12c013b21d88288384760'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.0/ecspresso_2.7.0_linux_arm64.tar.gz'
      sha256 '19855ff78d7327db58c41c7f707e2966c3d964dd0a33f82fcb11cef3f37e7adc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.0/ecspresso_2.7.0_linux_amd64.tar.gz'
      sha256 'bd285ef0fd0d46dd8c63a077faa92db82d7792755fc211a359db97c9260b6847'
    end
  end

  head do
    url 'https://github.com/kayac/ecspresso.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'cmd/ecspresso/ecspresso'
      system 'mv', 'cmd/ecspresso/ecspresso', '.'
    end
    bin.install 'ecspresso'
  end
end
