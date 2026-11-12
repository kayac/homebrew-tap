class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.9'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.9/ecspresso_2.8.9_darwin_arm64.tar.gz'
      sha256 '2386fec01d3f7414231c4816ff43d53cf1ef44f84a7392e09adc3509d7bee63b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.9/ecspresso_2.8.9_darwin_amd64.tar.gz'
      sha256 '4be7e24b6ac6a7a4df34f39fc1d29ff0918140bcc511b80eaa51f79201ded9a4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.9/ecspresso_2.8.9_linux_arm64.tar.gz'
      sha256 '9274e5db8cc1b73dbe6f9c7205f6ca887c58192be3399cde611b4ace76a463bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.9/ecspresso_2.8.9_linux_amd64.tar.gz'
      sha256 '85b071d9325c073d2e0bdf765b1c565e3ce5afd52de4a7c5b10cbce0a09731ba'
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
