class Ecspresso < Formula
  version '1.5.2'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.2/ecspresso-v1.5.2-darwin-amd64.zip"
    sha256 'e9dc9b5e56ab3aefa66a8b2de6b3e260c7424c063f011d099063f36a191d57b9'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.2/ecspresso-v1.5.2-linux-amd64.zip"
    sha256 '41d4924f3884fcb9cea402b43db9a7cb7c6e47e5ba6e0ab7bd52b3070fbb92e2'
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
