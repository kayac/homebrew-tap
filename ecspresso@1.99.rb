class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.5'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.5/ecspresso_1.99.5_darwin_arm64.tar.gz'
      sha256 '9b2d4717c7d857058163f5365dafa86653894a00102fd0c6934145b3f78b10f5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.5/ecspresso_1.99.5_darwin_amd64.tar.gz'
      sha256 '819e30b56a1e6b3dd67fd450ebde90233a17e3d54497c03dd770b4736aa90a54'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.5/ecspresso_1.99.5_linux_arm64.tar.gz'
      sha256 'd873357286f73ec4bbd59ded6353587bcddcacd31e0f71d7fe46d3b75b606579'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.5/ecspresso_1.99.5_linux_amd64.tar.gz'
      sha256 '3482c905a043d3440b4a54e2f84e9f0256a7c36eeb2c510836ba72778f7125a6'
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
