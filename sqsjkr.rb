class Sqsjkr < Formula
  version '0.4.1'
  homepage 'https://github.com/kayac/sqsjkr'
  if OS.mac?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.4.1/sqsjkr_0.4.1_darwin_amd64.tar.gz"
    sha256 'b4d14dfc56abd6180685fce72316f1d4095bc3675f7085e2035acfc32f8b4bf7'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.4.1/sqsjkr_0.4.1_linux_amd64.tar.gz"
    sha256 'c7afb5855f76429270516f073d2a7156a0dba8d71ec84818308c8cc56d233ba9'
  end
  head 'https://github.com/kayac/sqsjkr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'sqsjkr'
  end
end
