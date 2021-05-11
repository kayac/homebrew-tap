class Ecspresso < Formula
  version '1.5.4'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.4/ecspresso-v1.5.4-darwin-amd64.zip"
    sha256 '36c3c54953b6f75efbf32e3e34fc5e9d0c6af21afeef4ba1793032216eba35be'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.4/ecspresso-v1.5.4-linux-amd64.zip"
    sha256 '955c322973a666427603d2fc3c19e5cf5f32384166d039d2c3859da5fd2b057a'
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
