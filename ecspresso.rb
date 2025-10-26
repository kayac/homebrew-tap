class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.2/ecspresso_2.6.2_darwin_arm64.tar.gz'
      sha256 'e5a77605ea04537e817151095b509c89f52e2c78d0e3ece178a044529a5f2ff3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.2/ecspresso_2.6.2_darwin_amd64.tar.gz'
      sha256 '0701285934c666e6648bde87b27cc2ffb2becc4f82fbe0e3ec1eac40ee270e35'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.2/ecspresso_2.6.2_linux_arm64.tar.gz'
      sha256 'bde025ee626a2735aaca51b18e466852d5070ac7fe267cbcbf498315752cdce4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.2/ecspresso_2.6.2_linux_amd64.tar.gz'
      sha256 '1ff62b9b7d97c4484868ea2ae47125950bd9f9dccc6dd69da7a400e6169661cd'
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
