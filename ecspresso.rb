class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.2.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.1/ecspresso_2.2.1_darwin_arm64.tar.gz'
      sha256 '4ec7688bfc2cbde5b2c9dccb534712d084ed853469372e94f193a495bf804cbb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.1/ecspresso_2.2.1_darwin_amd64.tar.gz'
      sha256 '3fb515df4beefb4d78f5eb1ac6e7693fce34e7c1b9e57d9b386acc2456456b5c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.1/ecspresso_2.2.1_linux_arm64.tar.gz'
      sha256 '59fae863d006744acbc8f92a9c3b0d7195c6d922c2456242094ee7d2219cfe59'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.1/ecspresso_2.2.1_linux_amd64.tar.gz'
      sha256 '6c2ccc53c9ab841f8384bbd44c7dace3f54f489d52d6542a6fabdf4f5dd4af81'
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
