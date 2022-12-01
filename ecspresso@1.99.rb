class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.6'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.6/ecspresso_1.99.6_darwin_arm64.tar.gz'
      sha256 '6b350c391926a60b413318b3e5121afc75ce213d45de5c74dff2f54e80d69c7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.6/ecspresso_1.99.6_darwin_amd64.tar.gz'
      sha256 'b5b052c176ac28b5a94d12a31a48b22fb8a6c7ba772a28ffa16620eb9e7ac45a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.6/ecspresso_1.99.6_linux_arm64.tar.gz'
      sha256 '3792de275d171629e55f76f7c87a758167aa91aed71b47f89147fda3a342b1cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.6/ecspresso_1.99.6_linux_amd64.tar.gz'
      sha256 'e984812e5d719a84449d8100c21e981401385a1835ead63fa3c10e97deb37853'
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
