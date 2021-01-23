class Ecspresso < Formula
  version '1.3.2'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.2/ecspresso-v1.3.2-darwin-amd64.zip"
    sha256 '77091b2a7134e07d76f23c76dc2ad022a3dc658a888145aaae2937de200eb727'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.2/ecspresso-v1.3.2-linux-amd64.zip"
    sha256 '947bc9dccf363babb9861e79abd6631501d93c0669f520d50771177725ddd5e0'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv ecspresso-v*-*-amd64 ecspresso'
    bin.install 'ecspresso'
  end
end
