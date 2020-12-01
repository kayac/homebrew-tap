class Ecspresso < Formula
  version '1.1.3'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.3/ecspresso-v1.1.3-darwin-amd64.zip"
    sha256 '0e3a2674d5912b53a1f0ba5347fd51fe543a04ff97a99df886c4a0b3992010f4'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.3/ecspresso-v1.1.3-linux-amd64.zip"
    sha256 'e8e67dbc83302d981b20c6cedcca3358ba4bba70a813e57c90f36ea88e0ec611'
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
