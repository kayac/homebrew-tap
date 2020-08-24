class S3ObjectRouter < Formula
  version '0.0.1'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.1/s3-object-router_0.0.1_darwin_amd64.tar.gz"
    sha256 'a44ddac95c9f60c0208dd829604ec95717c288d32ec40573422565e5b40c9492'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.1/s3-object-router_0.0.1_linux_amd64.tar.gz"
    sha256 '50e98fc208542a7a121a1bf8a5836e27610fd539fb5fd11faf047fb9c6303520'
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
