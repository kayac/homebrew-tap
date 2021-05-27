class Ecspresso < Formula
  version '1.5.5'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.5/ecspresso-v1.5.5-darwin-amd64.zip"
    sha256 '8866080c1aa9d5543ddbd52fd71b89926ad48c21b59351ec08843b14f9180fa1'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.5/ecspresso-v1.5.5-linux-amd64.zip"
    sha256 '6fba778d67fceb917ad5a02e1ad99eede80ad3ecdda2f6e38e4dd3e0ad8d8e30'
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
