class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.6'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.6/ecspresso_2.8.6_darwin_arm64.tar.gz'
      sha256 '51f5e3455bf7114ac15f0143c664dfddda821fdac106f9e496ec865d065889d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.6/ecspresso_2.8.6_darwin_amd64.tar.gz'
      sha256 'd46f4aacfff02c7f2fddf6ec904a90e8e6486ee14e8fc474af3ba2269f2394aa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.6/ecspresso_2.8.6_linux_arm64.tar.gz'
      sha256 '93a4576dc83db05c5834f8272472701ebaf72dc59d78a502cc69fefc84770d20'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.6/ecspresso_2.8.6_linux_amd64.tar.gz'
      sha256 'f055ec78673fc15a12f7254e9ab9154132599c491511bdff2f5f5831294da310'
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
