class EcspressoAT099 < Formula
    version '0.99.5'
    homepage 'https://github.com/kayac/ecspresso'
    if OS.mac?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.5/ecspresso-v0.99.5-darwin-amd64.zip"
      sha256 '0fe005d1d47f31ae8a6cfb311ec14032298ec7894d2a821a8e5a9cef618303a7'
    end
    if OS.linux?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.5/ecspresso-v0.99.5-linux-amd64.zip"
      sha256 '1aee66a650d739297b020c4da39cd3a37cfa491936b104be0a5454d69909a2cc'
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
