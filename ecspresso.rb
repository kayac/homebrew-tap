class Ecspresso < Formula
  version '1.6.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.1/ecspresso_1.6.1_darwin_amd64.tar.gz"
    sha256 '0a6788a09abb6106db6d317628af6236ae587a9f66944556cf974481599687ac'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.6.1/ecspresso_1.6.1_linux_amd64.tar.gz"
    sha256 '0384b5b0864d6404bd2a3fdfcc49afa23c9c40a95076d8ec744abee69603feed'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ecspresso'
  end
end
