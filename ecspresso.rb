class Ecspresso < Formula
  version '0.14.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.14.0/ecspresso-v0.14.0-darwin-amd64"
  sha256 '6a97ff2e27443de0535862492091473b58d994ed9ff437dbaa28665ecda10e58'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.14.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
