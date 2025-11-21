class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.4/ecspresso_2.6.4_darwin_arm64.tar.gz'
      sha256 '83cd3d3ad8d578da0d322e45576c35fa51dd4234d1796adaa555e1c945260886'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.4/ecspresso_2.6.4_darwin_amd64.tar.gz'
      sha256 'd2b1a5fdc52212f232e25409f47122a8805e99c71942f4161d523afec111b075'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.4/ecspresso_2.6.4_linux_arm64.tar.gz'
      sha256 '5c886753e5d2c1b1204deaefb38d645560192d218de3d65b2c19971510de9201'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.4/ecspresso_2.6.4_linux_amd64.tar.gz'
      sha256 '5b6947e90e98e3be613c885b1bbe4be4bd0c5e24934d469f2e16c0320d8daf7d'
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
