class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.0/ecspresso_2.8.0_darwin_arm64.tar.gz'
      sha256 '2118d4e20cf7266d5fbdb48bb4a9087cd9257214e8fda3c47ee1f879eb717926'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.0/ecspresso_2.8.0_darwin_amd64.tar.gz'
      sha256 '04d9840f2732a33d47adb014217cc943459caa249dee8da5e7e9e089ecd4c84f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.0/ecspresso_2.8.0_linux_arm64.tar.gz'
      sha256 '3373ac1507fa09800a951ebb565dd1ded3123394014c75f9412131c0ca63426e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.0/ecspresso_2.8.0_linux_amd64.tar.gz'
      sha256 '7f9a7a0f52dff219d89a61bd1c545124fe1c3d259f677aee0d9eb0393aabc4a7'
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
