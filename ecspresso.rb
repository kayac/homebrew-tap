class Ecspresso < Formula
  version '1.1.1'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.1/ecspresso-v1.1.1-darwin-amd64.zip"
    sha256 'f7c7ff8a7715b2052c53a60a6e0f3c73a7bc4416e38578290cd5c320af8d3c17'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.1.1/ecspresso-v1.1.1-linux-amd64.zip"
    sha256 '4cb88131f43e912e41d33b5db85f3ef60affa0da5743beb5f4d60d6291829f94'
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
