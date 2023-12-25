class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.1/ecspresso_2.3.1_darwin_arm64.tar.gz'
      sha256 '5be5a1dbe7ba61e9f8df358117005ad213629563335ab2f41597a2da0b36fa39'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.1/ecspresso_2.3.1_darwin_amd64.tar.gz'
      sha256 '01ab3ba958e91de8042b59a8c5390aca0c381c6edfb8f3a5162b3a8d085ad30c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.1/ecspresso_2.3.1_linux_arm64.tar.gz'
      sha256 '2556f698b8030f267afaa30c860fd37c1704acd3d9739a8b435b157470d2691c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.1/ecspresso_2.3.1_linux_amd64.tar.gz'
      sha256 '8481ccd007807b5048313bb5987bee046fcff6450390dad3107d62370f59d38a'
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
