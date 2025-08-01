class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.0/ecspresso_2.6.0_darwin_arm64.tar.gz'
      sha256 '41bf70b5de50d3997a0dc0706aa070d07195ee4111fa6e402539ccbb14cec8ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.0/ecspresso_2.6.0_darwin_amd64.tar.gz'
      sha256 'f7b816c146dad4ee2f09dec4f88a87379a1b5108060cb2f2a61d4bbe48ce014a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.0/ecspresso_2.6.0_linux_arm64.tar.gz'
      sha256 '44005767f424015e975114c4e48762115acae4cbfacf9d187e27bb920ec59cb9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.0/ecspresso_2.6.0_linux_amd64.tar.gz'
      sha256 '59789d155d2ea5935a5082b874e0fc4f61158cb17475d77b7289a4152b8f077d'
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
