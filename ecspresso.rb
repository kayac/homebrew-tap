class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.0.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.1/ecspresso_2.0.1_darwin_arm64.tar.gz'
      sha256 '5f74f944541a4113baba5929266fd8bfd1f78c4e6d5da594d74b1c7695b67c40'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.1/ecspresso_2.0.1_darwin_amd64.tar.gz'
      sha256 'd7f7f97018fcea91b8ce70414505dbe573bf4a9f74b6a121ab2d69520d5a81ee'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.1/ecspresso_2.0.1_linux_arm64.tar.gz'
      sha256 'ecba96e0331810d46bd77d55b7455bd818a9fde045ae1ab1faa1dcd6dcc28697'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.1/ecspresso_2.0.1_linux_amd64.tar.gz'
      sha256 'd69a974c094da09f04540e3641e84a3817b9dba7d05d2cae4b9c5d14f16b7062'
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
