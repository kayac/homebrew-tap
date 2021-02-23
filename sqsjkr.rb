class Sqsjkr < Formula
  version '0.5.0'
  homepage 'https://github.com/kayac/sqsjkr'
  if OS.mac?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.5.0/sqsjkr_0.5.0_darwin_amd64.tar.gz"
    sha256 '1c66d926870353da467c0bd1ad2b08c7ef97a3dccc01a1895eabc06d431a56d7'
  end
  if OS.linux?
    url "https://github.com/kayac/sqsjkr/releases/download/v0.5.0/sqsjkr_0.5.0_linux_amd64.tar.gz"
    sha256 '394c3ed40c7a2942805daab425c16cec39057116d11f9f9bf08d00d797f8c552'
  end
  head 'https://github.com/kayac/sqsjkr.git'

  head do
    depends_on 'go' => :build
  end

  def install
    bin.install 'sqsjkr'
  end
end
