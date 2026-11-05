class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.8'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.8/ecspresso_2.8.8_darwin_arm64.tar.gz'
      sha256 '7e90e7f2f9a9dd1ca1eb5fa2ffec09055121428f2eea7e2e2c10cfcde7fba40f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.8/ecspresso_2.8.8_darwin_amd64.tar.gz'
      sha256 'e8bb182d3674252327c32b726b5891747b015d9015ac985cb9ce919742182251'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.8/ecspresso_2.8.8_linux_arm64.tar.gz'
      sha256 'a50e341caaa249829af4f7cc372d7989787635da7c4b95bc4ef9145defb85af1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.8/ecspresso_2.8.8_linux_amd64.tar.gz'
      sha256 '595e0027e95c2c0ec1108d2ff582082a6b87da94f7db4b959696c789a98a6fd9'
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
