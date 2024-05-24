class S3ObjectRouter < Formula
  version '0.1.1'
  homepage 'https://github.com/kayac/s3-object-router'
  if OS.mac?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.1.1/s3-object-router_0.1.1_darwin_amd64.tar.gz"
    sha256 'fe3f4bc7a44bbcb50c4c6679637020ae708506bcd1c91cab66812a55803232d1'
  end
  if OS.linux?
    url "https://github.com/kayac/s3-object-router/releases/download/v0.1.1/s3-object-router_0.1.1_linux_amd64.tar.gz"
    sha256 '1f2db90bff357f79ec962c1b7bfa242f1e6b472ac93dee4fd3208253b688deb3'
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
