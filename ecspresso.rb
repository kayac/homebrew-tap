class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.7.13'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_darwin_arm64.tar.gz'
      sha256 'ef2cb00246a3da2f2ed9897cf19d4c813b7c9947dcc526daea1ea9323edc7ea2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_darwin_amd64.tar.gz'
      sha256 '5aa341affd2e821d024829303de0753af8231b741709e0ca0c159b401d0ad9c6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_linux_arm64.tar.gz'
      sha256 '5a165e76e03d0bb391161fe71af0b610cd1e82ac024f3fbbfa39be361dafd4d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_linux_amd64.tar.gz'
      sha256 'd30b91019263b08efed062f0cfd2e7af40afc055b231ab57f20749b00ede705f'
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
