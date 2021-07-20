class S3ObjectRouter < Formula
  version '0.0.6'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.6/s3-object-router_0.0.6_darwin_amd64.tar.gz"
    sha256 '306dc471e0d69bb423178d300e6f42ce2bc8c3783d5fd15c0e89a1bf7207899d'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.6/s3-object-router_0.0.6_linux_amd64.tar.gz"
    sha256 'e329cbf0c6c2fb274f63259fb69004d6377b68fc35dadef005a78ad6497acd4b'
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
