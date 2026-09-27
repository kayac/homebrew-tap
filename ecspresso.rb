class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.7'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.7/ecspresso_2.8.7_darwin_arm64.tar.gz'
      sha256 '8c26a9d293cb0c29242e0ce9fbed0504368085f9d1fd33233a8ba568a210efb2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.7/ecspresso_2.8.7_darwin_amd64.tar.gz'
      sha256 'cccb957dd5eae513e329dcb1c2a6add7d9a6b4bf8b19d0e42535c9a9fa9086ed'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.7/ecspresso_2.8.7_linux_arm64.tar.gz'
      sha256 '70b50006b4a9507112e14e72b45cabc2ccefa32b5a88bb4084d8026883a500cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.7/ecspresso_2.8.7_linux_amd64.tar.gz'
      sha256 '88e9573b48b020db810e458ee6cff16b54061f984c573f940da4d6408eb38d82'
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
