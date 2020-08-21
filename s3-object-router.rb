class S3ObjectRouter < Formula
  version '0.0.0'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.0/s3-object-router_0.0.0_darwin_amd64.tar.gz"
    sha256 '453ee907aee716650d737ffd04d699fbb48d03813f3b31e5ea6f6114f25e6a30'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.0.0/s3-object-router_0.0.0_linux_amd64.tar.gz"
    sha256 '509ae67ccac333e6802d38373f86a26351c0b104bdc4b196f610fa89f78f2f3d'
  end
  head 'https://github.com/kayac/s3-object-router.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 's3-object-router'
    end
    bin.install 's3-object-router'
  end
end
