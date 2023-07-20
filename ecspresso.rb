class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.2.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.2/ecspresso_2.2.2_darwin_arm64.tar.gz'
      sha256 'f48bfcc3f354a8d7e1104e473031312b354bc86e4b661903d64bb2d57244158b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.2/ecspresso_2.2.2_darwin_amd64.tar.gz'
      sha256 '18baefb617d63824e9ce71e28fc55532ab6bb40cd7650d5e985e10464271a400'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.2/ecspresso_2.2.2_linux_arm64.tar.gz'
      sha256 'b164c4e4eef9296f5d0ca74f9888e81cb0c94c6f868ab94c027f79584a455fd8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.2/ecspresso_2.2.2_linux_amd64.tar.gz'
      sha256 '92f954f9b467ab7359032cd7825408b4366661845fa07a9d93471f5cbc76c858'
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
