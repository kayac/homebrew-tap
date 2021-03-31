class S3ObjectRouter < Formula
  version '0.0.3'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.3/s3-object-router_0.0.3_darwin_amd64.tar.gz"
    sha256 '7341560aa524011da8895247f85693f7973069fe789740ff77b5aaa34eadd19b'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.3/s3-object-router_0.0.3_linux_amd64.tar.gz"
    sha256 'dbcbdc63b7513b0849e3c23ceee2dbb13aed5bedb45031663593c0c97c1ee4cd'
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
