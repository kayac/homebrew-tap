class Ecspresso < Formula
  version '1.7.9'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.9/ecspresso_1.7.9_darwin_amd64.tar.gz"
    sha256 '701126396440d0d9a11f82f8d239cf9d6b7de08fb866ca9ec8f56699656d93ec'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.9/ecspresso_1.7.9_linux_amd64.tar.gz"
    sha256 '968917add7a07bea77f9724f6463f2c4d2dd9b4cd45c1a6603658a66d2acc79d'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
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
