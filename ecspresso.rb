class Ecspresso < Formula
  version '0.15.0'
  homepage 'https://github.com/kayac/ecspresso'
  url "https://github.com/kayac/ecspresso/releases/download/v0.15.0/ecspresso-v0.15.0-darwin-amd64"
  sha256 '8220a4537b09a11ba02bf27b7271527a733181c587dd12eea8b0580f8ba96204'
  head 'https://github.com/kayac/ecspresso.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv', 'ecspresso-v0.15.0-darwin-amd64', 'ecspresso'
    bin.install 'ecspresso'
  end
end
