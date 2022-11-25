class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.4/ecspresso_1.99.4_darwin_arm64.tar.gz'
      sha256 '1eb40cb52a5cff6458373b19f1e82acfd010d9143b6f065ce89946adcf59da75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.4/ecspresso_1.99.4_darwin_amd64.tar.gz'
      sha256 '096e9cb1f007faab24fc342f9b647248eeda54784c739cefde32d20faf5cdad2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.4/ecspresso_1.99.4_linux_arm64.tar.gz'
      sha256 'c923d69aa74c7dcbe2a18a56c3efd7d931efcad35db00f68b2daf9f4db7701ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.4/ecspresso_1.99.4_linux_amd64.tar.gz'
      sha256 'ed4f6fce6518251c2b35771c2c3f5b77e44ac06967c058c055fe8b61dcd8de36'
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
