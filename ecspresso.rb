class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.0.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.4/ecspresso_2.0.4_darwin_arm64.tar.gz'
      sha256 '74fe8cd3664e4f6e8c648fe96f56e09fcc11aededea9c018bd8940822c4a9404'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.4/ecspresso_2.0.4_darwin_amd64.tar.gz'
      sha256 '0ae5c170136031d6030da18b17ec09c166fe80f78e6b82e44d26d2d9fecb1f7c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.4/ecspresso_2.0.4_linux_arm64.tar.gz'
      sha256 '9c1ee82eba1d130bdc58f6f0de43bf47034a7cb347b30ead44a859d74c97cdcf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.4/ecspresso_2.0.4_linux_amd64.tar.gz'
      sha256 'fe0fe1336bd56d0a2568462f0250effaa614322e39818384c541d88edc412b4c'
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
