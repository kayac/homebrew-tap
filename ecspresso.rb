class Ecspresso < Formula
  version '1.7.6'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.6/ecspresso_1.7.6_darwin_amd64.tar.gz"
    sha256 '8c24973087398f3f013abc431526d84dd191c471806f6a691ac19ca255246c47'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.6/ecspresso_1.7.6_linux_amd64.tar.gz"
    sha256 'e238dd72e4b114088e101180a21f724d203cc8a3c81d092fa8ad01b55b2706fe'
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
