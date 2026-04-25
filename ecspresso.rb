class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.2/ecspresso_2.8.2_darwin_arm64.tar.gz'
      sha256 'd0f89c78a0d471a4a81a72317dca6845ae2a8d6905c5d81cce59b8403f59be30'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.2/ecspresso_2.8.2_darwin_amd64.tar.gz'
      sha256 '514a4e053fed3beb60d9b2de3ab66f121855d97b0bc16fa6cd74f353564ca764'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.2/ecspresso_2.8.2_linux_arm64.tar.gz'
      sha256 '769d417931d22da218c921c476285bf9af120910d5ba1e1df79d978aa32d55bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.2/ecspresso_2.8.2_linux_amd64.tar.gz'
      sha256 '62d82c0cd9929c6896c5d507ec79fae6f51524448a6e48a06eb85a864dee4adc'
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
