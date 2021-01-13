class Ecspresso < Formula
  version '1.3.0'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.0/ecspresso-v1.3.0-darwin-amd64.zip"
    sha256 '9efd6282a5750a8df775edd4ded279afecb5730e14901168021054e1c195d2c2'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.0/ecspresso-v1.3.0-linux-amd64.zip"
    sha256 '03e0a0f17d418ca0d6432877457997c9a393bbafa8744859b227965c0df296a9'
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
