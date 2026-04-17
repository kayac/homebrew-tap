class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.1/ecspresso_2.8.1_darwin_arm64.tar.gz'
      sha256 'd909d7cd84acb9a4996808c118cdb8df06ac4aa1b63e939c9aaf7248c39a3a76'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.1/ecspresso_2.8.1_darwin_amd64.tar.gz'
      sha256 'c4624eb7cbed75aaf15d9a573efc6fc6370d3b2342daf49cd0fe026c91a82a34'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.1/ecspresso_2.8.1_linux_arm64.tar.gz'
      sha256 'bb178370081fe52dbfc2eaad938b147246874a782e6f17a5dfbdeaad84852392'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.1/ecspresso_2.8.1_linux_amd64.tar.gz'
      sha256 '521dd3689c9e4482d6073c940b6b387ef9561144f750fdd92e33d5b7f9a03427'
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
