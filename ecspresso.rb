class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.0.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.3/ecspresso_2.0.3_darwin_arm64.tar.gz'
      sha256 'f28e055a142d7deeecf255fe60753414c5e1c278a5acfc66bcb5bb8e410a1d9d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.3/ecspresso_2.0.3_darwin_amd64.tar.gz'
      sha256 '0ad1c5b23b3d0256df6335da3b3dc21805d5080d26fc180b5f38b7e4a4d944bd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.3/ecspresso_2.0.3_linux_arm64.tar.gz'
      sha256 '6396a4f0ddcc03adf986e920d86477583b820c51c27bacc5f46ca9dd352b710d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.3/ecspresso_2.0.3_linux_amd64.tar.gz'
      sha256 '15bc0ac01976679e34fca851d83d5645d78142b34c8091b1649d27d0cd0bce21'
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
