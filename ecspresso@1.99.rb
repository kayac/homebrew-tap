class EcspressoAT199 < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.99.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.3/ecspresso_1.99.3_darwin_arm64.tar.gz'
      sha256 '09b16d03c5c9307e2b9b00522578af946a2c3ca2e38089dfed320379fdcd2bc4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.3/ecspresso_1.99.3_darwin_amd64.tar.gz'
      sha256 '48c2caaa129a7f0bafd4c63978661c7b2af95a34cd972d359cde36f505b04983'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.3/ecspresso_1.99.3_linux_arm64.tar.gz'
      sha256 '8a515a2345a7f2facb1ca42543569fd5e7f44fc705867398b1cff0daaf0fc0e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.99.3/ecspresso_1.99.3_linux_amd64.tar.gz'
      sha256 '5955438b05395b4f28effa2d962f28ab8a17a7413e279edf0f3de06a39171dd2'
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
