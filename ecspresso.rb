class Ecspresso < Formula
  version '1.7.11'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.11/ecspresso_1.7.11_darwin_amd64.tar.gz"
    sha256 '9d0860b5fcde0fc0af28a029d4ea65f1565ea96ba21f4db02090dbc00b209e8c'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.11/ecspresso_1.7.11_linux_amd64.tar.gz"
    sha256 '8767e551c853863caae9b21ddc80c3dc8142d280236debbcc17dba54cc4dc9a4'
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
