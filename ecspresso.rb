class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.4'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.4/ecspresso_2.4.4_darwin_arm64.tar.gz'
      sha256 '3644dca88312547fbb70dc99c66963c65880c820b809f793234ddf3d4d42a8bd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.4/ecspresso_2.4.4_darwin_amd64.tar.gz'
      sha256 '3d1bba5596ceb23002d2c7d95a9254113b6da40a28d03f5fb6728f37ff1114a5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.4/ecspresso_2.4.4_linux_arm64.tar.gz'
      sha256 '72f892555dd7c52301aed40cf1586134820cdd7bfef14a6d57c5e41a45813ef1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.4/ecspresso_2.4.4_linux_amd64.tar.gz'
      sha256 '68a65a23d1f0d42af95f031606b3363a7281f9e27f182481207aba7df8f4ff56'
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
