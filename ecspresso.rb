class Ecspresso < Formula
  version '1.3.3'
  homepage 'https://github.com/kayac/ecspresso'
  if OS.mac?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.3/ecspresso-v1.3.3-darwin-amd64.zip"
    sha256 '6bced8dd58b183dc0669d708a831591be3fca93d726649e2a0c9ddea7f25fdc4'
  end
  if OS.linux?
    url "https://github.com/kayac/ecspresso/releases/download/v1.3.3/ecspresso-v1.3.3-linux-amd64.zip"
    sha256 'c2626fcbd8f9f00e817cda468a14c63ac7d9ea4cb9be5188f1909de1d2a3b463'
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
