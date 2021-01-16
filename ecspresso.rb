class Ecspresso < Formula
  version '1.3.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.1/ecspresso-v1.3.1-darwin-amd64.zip"
    sha256 'baca5396e865099dd28b6e3940998530c0071a64f9b8683c0724fad0d8a0218f'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.1/ecspresso-v1.3.1-linux-amd64.zip"
    sha256 'a17501fad11838732949efc28a7ecd9cac0112c74d65bdee3fd15baa445461f6'
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
