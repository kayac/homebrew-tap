class Ecspresso < Formula
  version '1.5.7'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.7/ecspresso-v1.5.7-darwin-amd64.zip"
    sha256 '8faa5ec061ee7362806d90a67da28f2984a590260ab7e36f234d0921974afd9e'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.7/ecspresso-v1.5.7-linux-amd64.zip"
    sha256 '9047f6135ca9ffec20751f4cd79c8d3b592df19e21c3e3ee3b6f37df29afb174'
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
