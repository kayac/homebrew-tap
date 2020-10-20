class Ecspresso < Formula
  version '1.0.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.0.0/ecspresso-v1.0.0-darwin-amd64.zip"
    sha256 'ad4ff2e9b712a9b44c89044602cec5b03e0d4da36d5f8ffa6d3f73f7922db756'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.0.0/ecspresso-v1.0.0-linux-amd64.zip"
    sha256 '9860da34c91eb8079fff8be440844015fe41502265165817dcf200b49978ddbb'
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
