class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.5'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.5/ecspresso_2.4.5_darwin_arm64.tar.gz'
      sha256 'b1d902c91b99353864f8eafbff81bc81c4509e76b831e88a5d4dbb192f0efb6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.5/ecspresso_2.4.5_darwin_amd64.tar.gz'
      sha256 '862a26082d7dd87b56d9ea27e604d12bff2b31c8c522a7ef3a596b03503178cb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.5/ecspresso_2.4.5_linux_arm64.tar.gz'
      sha256 'c14966b8d8c0b6e0029dc46eac44dbe327a8a19fc5f455c73af17ea14e1f625b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.5/ecspresso_2.4.5_linux_amd64.tar.gz'
      sha256 '7085a212b11ccdc2e109102942aa27c930cf6d81b9dcc767a0354ecbabc0033a'
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
