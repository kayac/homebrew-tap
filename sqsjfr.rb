class Sqsjfr < Formula
  version '0.0.0'
  homepage 'https://github.com/kayac/sqsjfr'
  if OS.mac?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.0/sqsjfr_0.0.0_darwin_amd64.tar.gz"
    sha256 'df7ad7ae54fdb35167661104f2083b33f21e0aa87f729b5920dd41c023325ad3'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjfr/releases/download/v0.0.0/sqsjfr_0.0.0_linux_amd64.tar.gz"
    sha256 '7479f1eada9227e64224a09416cecaa653b6b24f271dc71760eb7cbfc89ad6c5'
  end
  head 'https://github.com/kayac/sqsjfr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make'
    end
    bin.install 'sqsjfr'
  end
end
