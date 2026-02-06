class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.7.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.1/ecspresso_2.7.1_darwin_arm64.tar.gz'
      sha256 '74db567c0030ff93a66c69f4471ae0a1907174275ae663c80d57e42480c6b089'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.1/ecspresso_2.7.1_darwin_amd64.tar.gz'
      sha256 '61f0533c1898ddab47ef412294f7e864992f79f35940e25b95412b06c28cb383'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.1/ecspresso_2.7.1_linux_arm64.tar.gz'
      sha256 'e31c64937840e5dc122bd5d3aab458b3842a4e57f6d162553351da602ba2a199'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.7.1/ecspresso_2.7.1_linux_amd64.tar.gz'
      sha256 '903f7d451358080f80e426d56a9265f072e6a395a733945ebc0eac3d2c16a0c4'
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
