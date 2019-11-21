class Ecspresso < Formula
  version '0.13.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.13.0/ecspresso-v0.13.0-darwin-amd64"
  sha256 'dd7a9f124f1847985da7aec07952501910a48038671ddb614cde7e5b80f2fda1'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.13.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
