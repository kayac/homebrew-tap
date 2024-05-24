class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.4/ecspresso_2.3.4_darwin_arm64.tar.gz'
      sha256 'd0362a15cee172d902e279db6626fa08a2304255021160bbeab54f97365033e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.4/ecspresso_2.3.4_darwin_amd64.tar.gz'
      sha256 '2a4c8941b80ab64932a5894c3043ca6ed216ef49342e136d760ef69e80dd1b22'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.4/ecspresso_2.3.4_linux_arm64.tar.gz'
      sha256 'dac8454b1c6729233b8083d388010ae68fcfa591f0ac42326fc5b69b014fab73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.4/ecspresso_2.3.4_linux_amd64.tar.gz'
      sha256 'deb12587c84febd857ae38e26b55d4fbe22f948d354532a67d9c0cf129876185'
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
