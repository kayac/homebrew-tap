class Ecspresso < Formula
  version '1.5.9'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.9/ecspresso-v1.5.9-darwin-amd64.zip"
    sha256 '28ec546290ac860170073f566298168474616003f348bea72a0c842a1249755a'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.9/ecspresso-v1.5.9-linux-amd64.zip"
    sha256 '4f2d15795395ee51c5eb978dea3908a32d0d27308be344dd8fb981f53b3c96d6'
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
