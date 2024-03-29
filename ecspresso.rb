class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.3'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.3/ecspresso_2.3.3_darwin_arm64.tar.gz'
      sha256 '5b085a1ba227f5f7df8a9ca793064567dfceaeee62d090561d47a4e6b730f29e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.3/ecspresso_2.3.3_darwin_amd64.tar.gz'
      sha256 'b01c1463a1bfd15eae51df30032b31e4d4523706125fd4fbdbc83be4b4d081b5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.3/ecspresso_2.3.3_linux_arm64.tar.gz'
      sha256 'a1df0d9fd0f046fccf2a00b212423af856313af65381ba82050658cb548faea1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.3/ecspresso_2.3.3_linux_amd64.tar.gz'
      sha256 '96f514b1ee58cd1d26ddb6a8b015d1483d4ac641398b32e01f6a0cd386c776cd'
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
