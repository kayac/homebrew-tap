class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.0/ecspresso_2.4.0_darwin_arm64.tar.gz'
      sha256 '2d6332ce2d12978a466bc07875fd672e7bf075bcbba658902a45da904b7d1360'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.0/ecspresso_2.4.0_darwin_amd64.tar.gz'
      sha256 '6c4a851b94b0d251251fed6901bb6799f42b696f85a1ab7c21e2697e9ebfddeb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.0/ecspresso_2.4.0_linux_arm64.tar.gz'
      sha256 'dee23848d24dea2f52661578c6893c3a88d6f4dd72894430f1d1aea302a6a222'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.0/ecspresso_2.4.0_linux_amd64.tar.gz'
      sha256 '66bb3bb1fe7da5906357aed6ea0b8e10ef3baa13a2996ac7199054943f1fe3ef'
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
