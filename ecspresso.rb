class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.3/ecspresso_2.6.3_darwin_arm64.tar.gz'
      sha256 'cf677eaf34b0b92fe6a68e22ba6a7868d6cbd974872894247da7b253df8b7b6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.3/ecspresso_2.6.3_darwin_amd64.tar.gz'
      sha256 'f4f700e8bc9fd9d886affd5505eb6b5739f25a0b7226e3e50c66917132af623a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.3/ecspresso_2.6.3_linux_arm64.tar.gz'
      sha256 '313558935b7b764ab0cd846f14ba9a2a8d28d781267ed25607390a36e367e9ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.3/ecspresso_2.6.3_linux_amd64.tar.gz'
      sha256 'd6e6b0f8c3dbd559fe091e07cc971dbc2d798613278ba80c26bf6e1661ee3b32'
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
