class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.5'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.5/ecspresso_2.6.5_darwin_arm64.tar.gz'
      sha256 'c2a41f07959fbcf7476c2e2feb3920f0d36e24c68ef52607075e9a449895dee3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.5/ecspresso_2.6.5_darwin_amd64.tar.gz'
      sha256 'd34f148076b4d3d44ca9f49657fd245c090d404105704dbd1d5be34c89a98ad8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.5/ecspresso_2.6.5_linux_arm64.tar.gz'
      sha256 'a2f62ea1ea6b43db2605e8976f5808d051ab45fbc8a48a96c2b625551b8f2b68'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.5/ecspresso_2.6.5_linux_amd64.tar.gz'
      sha256 'dfa0114b031399a487dbd3b7f10e332f97841f2e20619a15587c427bb82744be'
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
