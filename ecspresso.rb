class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.3/ecspresso_2.4.3_darwin_arm64.tar.gz'
      sha256 '5bd398d2996d618465eedd8ca75357272661b73eab6215ed62bfc0d9082f515b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.3/ecspresso_2.4.3_darwin_amd64.tar.gz'
      sha256 '36bbb806ddb7b81f27e7464dea47c0934019291acc5a994d69bd36f39218ff93'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.3/ecspresso_2.4.3_linux_arm64.tar.gz'
      sha256 'aa9ca30c60f89096468097e9a0185eab1c0e6a5afa0bc0f82d29c27517c20628'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.3/ecspresso_2.4.3_linux_amd64.tar.gz'
      sha256 'f03d298db43cc7b7bee491f2e62515815c97547ebf7c1bd59b7a548fc2cac36a'
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
