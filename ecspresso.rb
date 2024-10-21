class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.2/ecspresso_2.4.2_darwin_arm64.tar.gz'
      sha256 '1d855fbeaa8e7a865a190983584fad43c5787697925ce650f08f57a0f801483c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.2/ecspresso_2.4.2_darwin_amd64.tar.gz'
      sha256 '88444dd2b7323b2714866c5d850cda1aa65455d3d3d938a8f8c8537660dbedd2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.2/ecspresso_2.4.2_linux_arm64.tar.gz'
      sha256 '584f354a4ab72e18c2a28dcb9a2881af2b52c14c87ecc48f2c862faf3a703ecb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.2/ecspresso_2.4.2_linux_amd64.tar.gz'
      sha256 '467ae5c90e80ec903092d01c2f6e9737340afdaddfa99d9e97bb86d95112946f'
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
