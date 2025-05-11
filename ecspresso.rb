class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.5.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.5.0/ecspresso_2.5.0_darwin_arm64.tar.gz'
      sha256 '4f710a450791faf255d5a1a64c59c221e877b66e0d5e4fa09b91c91c12167736'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.5.0/ecspresso_2.5.0_darwin_amd64.tar.gz'
      sha256 '3493c502737cdf68c6f686513ce322aa284969409489604cb4b7048395ccf1e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.5.0/ecspresso_2.5.0_linux_arm64.tar.gz'
      sha256 '48273fd9c315fa86be7155071ca2849ea2b6273dbf0f4ba4bcc8e30ccb748ac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.5.0/ecspresso_2.5.0_linux_amd64.tar.gz'
      sha256 '0ef850f642bfa539921630538a92d42e9afa6adef00a5c470bb0d614b0513715'
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
