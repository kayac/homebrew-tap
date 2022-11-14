class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.2/ecspresso_1.99.2_darwin_arm64.tar.gz'
      sha256 '3dbea93ba8f818dff400b2ac2d7086070a2612429513a581e93d20502cc0dc7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.2/ecspresso_1.99.2_darwin_amd64.tar.gz'
      sha256 'df6136f794ee3636df7ad9977f3e276094fa77b35908c46f6928e3b3ece3ceea'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.2/ecspresso_1.99.2_linux_arm64.tar.gz'
      sha256 'a71e22b70e859b08575c4c762b491d8c622b303286e7539e4523b16360291902'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.2/ecspresso_1.99.2_linux_amd64.tar.gz'
      sha256 '54f8a5dd530e274a4bc40e2bf3afdd35ee9df97d7b876fc995c4873ac462acf1'
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
