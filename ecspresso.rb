class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_darwin_arm64.tar.gz'
      sha256 'c5e13345d17e3b52ad737c54cc7195e007d19d88799c93d1c1861651ec74b778'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_darwin_amd64.tar.gz'
      sha256 'd0ffa6a8c82cffa93031fb1386e766f36301e44a13a13e4f824452b43ae7dc71'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_linux_arm64.tar.gz'
      sha256 '9996217f24674edb106057a2f6fde97be7b88a7d16c58889fa38d9cf193b5585'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_linux_amd64.tar.gz'
      sha256 '07d743dc0b6d125439e6d3ddf89e0af1308bcb49601ac0b6be2fd88dca49f687'
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
