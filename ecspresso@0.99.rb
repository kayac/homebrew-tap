class EcspressoAT099 < Formula
    version '0.99.8'
    desc "This is a pre-release version of ecspresso. Fomula for a limited time"
    homepage 'https://github.com/kayac/ecspresso'
    if OS.mac?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.8/ecspresso-v0.99.8-darwin-amd64.zip"
      sha256 'a53aee703fefca2f64597e350c7359e02492c2b72a0fc745409f00714357967c'
    end
    if OS.linux?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.8/ecspresso-v0.99.8-linux-amd64.zip"
      sha256 '4f948dc009b316c3ce7d3055d09cd1381b5b57f1f17cef10caebfe5b39ebf054'
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
