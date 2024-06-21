class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.5'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.5/ecspresso_2.3.5_darwin_arm64.tar.gz'
      sha256 '044e9d54c431a3407fd5403d3205b8467cc9a0d0f867b281bed3c89bf829c1c3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.5/ecspresso_2.3.5_darwin_amd64.tar.gz'
      sha256 '13dea17f360ac3faa919dc4cb9fd64f86795decfc1567682c2467ed5627b4b46'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.5/ecspresso_2.3.5_linux_arm64.tar.gz'
      sha256 '496ee0295a51e18f6862e485a45049f14a64cd1ff8eb4c0f30d8bc9f8aa60ac4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.5/ecspresso_2.3.5_linux_amd64.tar.gz'
      sha256 'f4da7ff630a262dbc426895078edbfd1e27e6aa6418e10c187b2c166a15950d2'
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
