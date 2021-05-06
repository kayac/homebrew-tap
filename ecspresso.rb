class Ecspresso < Formula
  version '1.5.3'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.3/ecspresso-v1.5.3-darwin-amd64.zip"
    sha256 'ab79f67f996acffa58366d26abb8c18a0b2e77b65fbf3f7c2c522f53b2e88029'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.5.3/ecspresso-v1.5.3-linux-amd64.zip"
    sha256 'b9eaf63edce5603271f6abfc2890594d308ac9f49fe285c32e8e11f7698d1d4c'
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
