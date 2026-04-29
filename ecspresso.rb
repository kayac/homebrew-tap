class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.3/ecspresso_2.8.3_darwin_arm64.tar.gz'
      sha256 '849fe537457ace45a9556a4b3cbd447051dc425a6e6aab65f06c081673ebe17d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.3/ecspresso_2.8.3_darwin_amd64.tar.gz'
      sha256 '8cba50771d7f743958d325120e1ce5dca0e128b5cb143e9c63c7d2a4e2a5c40a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.3/ecspresso_2.8.3_linux_arm64.tar.gz'
      sha256 'eaff105cdfff563fb1c4ee34b7754b1559214c8f185ffd533d78d814db068b0d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.3/ecspresso_2.8.3_linux_amd64.tar.gz'
      sha256 '2bd4ec3364924fd974aaead5791a9fcad3f4d1b9a30bf01b0a4f042ebac79ab0'
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
