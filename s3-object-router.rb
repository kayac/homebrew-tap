class S3ObjectRouter < Formula
  version '0.0.5'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.5/s3-object-router_0.0.5_darwin_amd64.tar.gz"
    sha256 '54fd61824820599e3d43b4e299cbb85d36e309dba1741ac2f77a663ef33db39d'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.5/s3-object-router_0.0.5_linux_amd64.tar.gz"
    sha256 '172a7733eb13f2b0702e1eb60c4eb55cdd3007456aa4d229b2f91ed64ccb2562'
  end
  head 'https://github.com/kayac/s3-object-router.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 's3-object-router'
  end
end
