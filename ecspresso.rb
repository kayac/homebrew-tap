class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.6.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.1/ecspresso_2.6.1_darwin_arm64.tar.gz'
      sha256 'bc1588d4bee80dab23d0903a36c120325460d9f38dadbe6ab66244d898f8cf35'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.1/ecspresso_2.6.1_darwin_amd64.tar.gz'
      sha256 '25011bcc56e731eccc53cf2b84ef7ebc88abcd9573c0369a10fbe415752dff18'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.1/ecspresso_2.6.1_linux_arm64.tar.gz'
      sha256 '8913180c5870925e737382697afe95a97de05421abf25e51651c7400563e3d9d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.6.1/ecspresso_2.6.1_linux_amd64.tar.gz'
      sha256 'd88518820436fa908acec712d788a4fe019d525bc836a1af99b87143126fa8c8'
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
