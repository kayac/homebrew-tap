class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.4/ecspresso_2.8.4_darwin_arm64.tar.gz'
      sha256 '22a126468511d5fb70709450aadbf8c85bda9df65eea1ffb265e2aae3d2a1da3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.4/ecspresso_2.8.4_darwin_amd64.tar.gz'
      sha256 '5d800a9ec71c65cab23820a4e5cd0b915e9d6d6918af8a085c7020b5df3bbae9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.4/ecspresso_2.8.4_linux_arm64.tar.gz'
      sha256 'ad3dc90b3db2451ad46813809fd812bd66e221220e656412367badae3d8149fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.4/ecspresso_2.8.4_linux_amd64.tar.gz'
      sha256 '652953ab0439f7837542f80fa03938b676574e8c85f477eb90df8e5b6d95ff68'
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
