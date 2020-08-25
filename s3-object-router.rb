class S3ObjectRouter < Formula
  version '0.0.2'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.2/s3-object-router_0.0.2_darwin_amd64.tar.gz"
    sha256 'e68e8fbf7d4be2439416a0d3c886fc707bd2ac06a47eefb444d988b4ae7c0540'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.2/s3-object-router_0.0.2_linux_amd64.tar.gz"
    sha256 '0eca25ae9216b83671e851f4d7296638c229c390bb0911250ca26c3caeb80078'
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
