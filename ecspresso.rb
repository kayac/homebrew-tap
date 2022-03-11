class Ecspresso < Formula
  version '1.7.10'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.10/ecspresso_1.7.10_darwin_amd64.tar.gz"
    sha256 '18424403c960c632e113064581e48a75f8955478466f0d54ba41efdb18056fee'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.7.10/ecspresso_1.7.10_linux_amd64.tar.gz"
    sha256 '2538b3af472690f9d75da387ba8b3fbd516a5ecfe5219d68aecbd9f56cf4f559'
  end
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'cmd/ecspresso/ecspresso'
      system 'mv', 'cmd/ecspresso/ecspresso', '.'
    end
    bin.install 'ecspresso'
  end
end
