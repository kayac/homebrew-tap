class S3ObjectRouter < Formula
  version '0.0.7'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.7/s3-object-router_0.0.7_darwin_amd64.tar.gz"
    sha256 '3994133ecafe8ba37fd67e4a499cd4ed255105d9e4a6fd17556c5fe5723caf24'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.7/s3-object-router_0.0.7_linux_amd64.tar.gz"
    sha256 '13a1f07f2247afe9cf4b852a7afee065321de4345b0b35008b8883aa6dc2ea0a'
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
