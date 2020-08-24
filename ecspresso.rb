class Ecspresso < Formula
  version '0.17.3'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v0.17.3/ecspresso-v0.17.3-darwin-amd64.zip"
    sha256 '34684ce9b841eec0d30c809081bbf8269c1b9456301282fb54cf907d6687743d'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v0.17.3/ecspresso-v0.17.3-linux-amd64.zip"
    sha256 'b2ec789655ccbb524e88b0d5a4a4803d518ec0da611571103aea6c32ebb3dfa7'
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
