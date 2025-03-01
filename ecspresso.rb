class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.6'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.6/ecspresso_2.4.6_darwin_arm64.tar.gz'
      sha256 'e007247e28181a623e515edbe478a9e30e69d49c7bd6b1bdca29cb24ca920e7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.6/ecspresso_2.4.6_darwin_amd64.tar.gz'
      sha256 'f41914075149ccda5c0878c1c8308680e426051559d1286c5385b12cfdf217be'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.6/ecspresso_2.4.6_linux_arm64.tar.gz'
      sha256 '1e37b8f3ec290c6210bac110f8ce291ad8bc2b96a3cb299ab58d4ab27c1b0db3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.6/ecspresso_2.4.6_linux_amd64.tar.gz'
      sha256 'eabe69c527e23c2cf29ec52b0735a664f166b39465b21dbc6a327ddf280efe1c'
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
