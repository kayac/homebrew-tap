class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.1/ecspresso_1.99.1_darwin_arm64.tar.gz'
      sha256 '018b7cb04c1015822368ad602921628b4dd3b30b6ed8f5bf213b43d9fca0717e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.1/ecspresso_1.99.1_darwin_amd64.tar.gz'
      sha256 '9f833d4a04c936bdda718a3c751c2d3d6d7237a227896642c1bb8de5ea0d5431'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.1/ecspresso_1.99.1_linux_arm64.tar.gz'
      sha256 'be87448dae707050c84d3b49cb7d6daf768dd217eab33949b28be6d9509c462f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.1/ecspresso_1.99.1_linux_amd64.tar.gz'
      sha256 'dc26f0458341abed23aec92fec954d8df6102618462c029088bc745312b2c42a'
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
