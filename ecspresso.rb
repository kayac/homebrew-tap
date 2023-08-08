class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.2.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.3/ecspresso_2.2.3_darwin_arm64.tar.gz'
      sha256 '7b2a679e2e8bd0cc1dc7e419c70f4c79b34436fbf3ef204e8f9ea8575022f015'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.3/ecspresso_2.2.3_darwin_amd64.tar.gz'
      sha256 '4f87aa21f39f100c245f9a249c937e7d7a8a8422602163181bd94073b2e722a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.3/ecspresso_2.2.3_linux_arm64.tar.gz'
      sha256 '93480165b32b6d16349f96b2da46475cc888d97c758675cf9dc4c956675ff13c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.3/ecspresso_2.2.3_linux_amd64.tar.gz'
      sha256 '859c846fa6a25766d2b1b530f89798c18613437a336112a2d0c767525598ef59'
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
