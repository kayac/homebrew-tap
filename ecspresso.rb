class Ecspresso < Formula
  version '1.7.3'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.3/ecspresso_1.7.3_darwin_amd64.tar.gz"
    sha256 '660bbc42e503162572ed2cd7d3783484fcba9c836f7010fd85a1740680c7b300'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.3/ecspresso_1.7.3_linux_amd64.tar.gz"
    sha256 '85119801f94d2dc2fd69ed0d6e48e2c39b80c8fc71fe0ae3d1e85124c1b8f2d3'
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
