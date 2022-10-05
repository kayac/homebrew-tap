class Ecspresso < Formula
  version '1.7.13'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_darwin_amd64.tar.gz"
    sha256 '5aa341affd2e821d024829303de0753af8231b741709e0ca0c159b401d0ad9c6'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.13/ecspresso_1.7.13_linux_amd64.tar.gz"
    sha256 'd30b91019263b08efed062f0cfd2e7af40afc055b231ab57f20749b00ede705f'
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
