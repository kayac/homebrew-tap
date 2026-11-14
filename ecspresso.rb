class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '3.0.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v3.0.0/ecspresso_3.0.0_darwin_arm64.tar.gz'
      sha256 '7d47a96cea99c64d6913417bf886ccb704e0d248b0a35ef4ccb1d1930988cfd0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v3.0.0/ecspresso_3.0.0_darwin_amd64.tar.gz'
      sha256 'fdfb490d3373bb93b7d58c1729f8069dd05c95eab47cf1d261e53c06e4ca8c1e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v3.0.0/ecspresso_3.0.0_linux_arm64.tar.gz'
      sha256 'f264358d016768ff05ce9df1ed746533fa224266a81f63c2791bdeca40d94153'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v3.0.0/ecspresso_3.0.0_linux_amd64.tar.gz'
      sha256 '7a66f09f72bbd3cb581763a7b22825438137ad8ee56d596321609ee364dd6b42'
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
