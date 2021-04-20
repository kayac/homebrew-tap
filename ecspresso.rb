class Ecspresso < Formula
  version '1.5.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.1/ecspresso-v1.5.1-darwin-amd64.zip"
    sha256 'f07203b99f5d0136a86b24e89c1f7bd01b62df24fd3f192ff2d274ff81f64bc2'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.1/ecspresso-v1.5.1-linux-amd64.zip"
    sha256 '82878bd4b4321fe2333a4ba806061cb3fbe5e1453e37317ad89a034cd0d5302c'
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
