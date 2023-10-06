class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.2.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.4/ecspresso_2.2.4_darwin_arm64.tar.gz'
      sha256 'ddeb7dc6d040b7c505cecbf2e31d6d825654d95fdf40054e876c95eaa6c105ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.4/ecspresso_2.2.4_darwin_amd64.tar.gz'
      sha256 'a9e0ab7ef2ecad9f3126ca1a82cf6c3b3121a2d803f101f0ad4c53de433f9f82'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.4/ecspresso_2.2.4_linux_arm64.tar.gz'
      sha256 '81b2a3a638881e3fc0dd61710f981f5bdaed3ea0ee34ee25bee14f722dc0e615'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.4/ecspresso_2.2.4_linux_amd64.tar.gz'
      sha256 '125b16386eaecbdd69621257bfabf07898650d1eed441fd3443df30151165903'
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
