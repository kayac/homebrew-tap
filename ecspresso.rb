class Ecspresso < Formula
  version '0.18.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v0.18.0/ecspresso-v0.18.0-darwin-amd64.zip"
    sha256 '7fee5a7c401afd84e9b099aba37bea41572fd29731ddc3e4afe4bea4b3470a36'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v0.18.0/ecspresso-v0.18.0-linux-amd64.zip"
    sha256 '7c3f38add73e07ab673f2b94bad3f7acdbf606a257454e3d1e316c2445b31725'
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
