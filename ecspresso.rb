class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.6'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.6/ecspresso_2.3.6_darwin_arm64.tar.gz'
      sha256 '1a67b92d6a2f1ed227eb45ac58a13187fe3aa99a164e8aef8f2390e6df1ba65e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.6/ecspresso_2.3.6_darwin_amd64.tar.gz'
      sha256 '75bc616c22cc178fa3757b097d46eead8f469e50893f7ad2d02f8b2377588c98'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.6/ecspresso_2.3.6_linux_arm64.tar.gz'
      sha256 '3f04b93b389e9adebae188966106b2787947ac616a139fb3278b31cb2cff98c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.6/ecspresso_2.3.6_linux_amd64.tar.gz'
      sha256 '45ad6bb7c1ff27fd5e919014776a8a11165910426248b4b60f3efc0966fc7516'
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
