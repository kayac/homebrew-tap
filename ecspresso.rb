class Ecspresso < Formula
  version '1.2.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.2.0/ecspresso-v1.2.0-darwin-amd64.zip"
    sha256 'cabfcd32dd5b6d2d2edfec4b7bf4ab0fc96cdc3beb87fdd180bcd1f4b0149f62'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.2.0/ecspresso-v1.2.0-linux-amd64.zip"
    sha256 '31ed3781a1217446d94ea5ec4c59dcceea82d34bdfcde3ce9e03a1dc495d10aa'
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
