class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.8.5'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.5/ecspresso_2.8.5_darwin_arm64.tar.gz'
      sha256 '7bff092d896e294417b5aa7a1611dc85955ee6860905b3d94043931ad76c60e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.5/ecspresso_2.8.5_darwin_amd64.tar.gz'
      sha256 '3865aa26d9bd8f0534948443f02bc706a806c75b82494ab2461b95e239d3514a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.5/ecspresso_2.8.5_linux_arm64.tar.gz'
      sha256 '71b88c6987acded2fce305865cf583667ece70ec4da1735b9827ae465ce61a8b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.8.5/ecspresso_2.8.5_linux_amd64.tar.gz'
      sha256 '7e2547a1126eae6d7f2381a7e576782e460b0e7e11eb91430a37def3bfa46b5c'
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
