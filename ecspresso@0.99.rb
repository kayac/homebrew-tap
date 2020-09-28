class EcspressoAT099 < Formula
    version '0.99.7'
    desc "This is a pre-release version of ecspresso. Fomula for a limited time"
    homepage 'https://github.com/kayac/ecspresso'
    if OS.mac?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.7/ecspresso-v0.99.7-darwin-amd64.zip"
      sha256 '8bc15cc9645b462a1e7345f0ed7733f88d22ee1b7046d13ae24ad888f8e1f6a7'
    end
    if OS.linux?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.7/ecspresso-v0.99.7-linux-amd64.zip"
      sha256 'bbe16ddfe47c86f727042e7d17903bd14be376a5df7ad2a8bbf68f7815388eb3'
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
