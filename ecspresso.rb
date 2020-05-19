class Ecspresso < Formula
  version '0.15.2'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.15.2/ecspresso-v0.15.2-darwin-amd64"
  sha256 '7db4fb17a8ba04b75c7b8cb6d7c4cc1570f74573405848e5b204c1bd9db4010f'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.15.2-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
