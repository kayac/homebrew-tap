class Ecspresso < Formula
  version '1.5.6'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.6/ecspresso-v1.5.6-darwin-amd64.zip"
    sha256 'fc1cce2f907e4ed40e8080238a7e55ddca36ed399b1bce844d9b61bab4ca73b7'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.6/ecspresso-v1.5.6-linux-amd64.zip"
    sha256 '3a3ea3a3d1cb6f2a7d4175a4b6c03a33a2426fbf9f5c57f6b756cc0e181e913f'
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
