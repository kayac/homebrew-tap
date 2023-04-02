class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.1.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.1.0/ecspresso_2.1.0_darwin_arm64.tar.gz'
      sha256 '264f09136013816c88f6583851627505abd80fbcae6f998ae8a2a766c235b00c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.1.0/ecspresso_2.1.0_darwin_amd64.tar.gz'
      sha256 '5695b800599a1e1f0606643245b4feec60918642aa67f1f9502f8e31280ca8f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.1.0/ecspresso_2.1.0_linux_arm64.tar.gz'
      sha256 '458f59b7351ba79907c141cd3ca7324bbca0b297353fba492db2a8d9947c47a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.1.0/ecspresso_2.1.0_linux_amd64.tar.gz'
      sha256 '16200199aa899cf8afcb50d9f735a12140bd5ddcf2bb733fefaa059d3b697378'
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
