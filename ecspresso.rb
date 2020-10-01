class Ecspresso < Formula
  version '0.18.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v0.18.1/ecspresso-v0.18.1-darwin-amd64.zip"
    sha256 '276d4d86cb1d8a38ed93e42675673ce712fa87614ce2ea99b46f81b5fa10b228'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v0.18.1/ecspresso-v0.18.1-linux-amd64.zip"
    sha256 'fc76dd96e206b7a07cafee1ab59a8e3ff02f1758ce091058f69c6d8c34b0adc0'
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
