class EcspressoAT099 < Formula
    version '0.99.6'
    desc "This is a pre-release version of ecspresso. Fomula for a limited time"
    homepage 'https://github.com/kayac/ecspresso'
    if OS.mac?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.6/ecspresso-v0.99.6-darwin-amd64.zip"
      sha256 '90e67263a9ffac707eec0c5c7dc828fadf835adc7d3e8ca26761825b3fe1213a'
    end
    if OS.linux?
      url "https://github.com/kayac/ecspresso/releases/download/v0.99.6/ecspresso-v0.99.6-linux-amd64.zip"
      sha256 '41481e03d08314ae189836c4cc52c781fab35e6069efb21ac46503f1bd70d73b'
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
