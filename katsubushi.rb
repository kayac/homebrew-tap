class Katsubushi < Formula
  version '1.5.4'
  homepage 'https://github.com/kayac/go-katsubushi'
  url "https://github.com/kayac/go-katsubushi/releases/download/v1.5.4/katsubushi-1.5.4-darwin-amd64.zip"
  sha256 'bfa76efd77d1c25ae3cc7406acdffb128b7c20bcbb091d4e9cdf0006bd1c871b'
  head 'https://github.com/kayac/go-katsubushi.git'

  def install
    bin.install 'katsubushi'
  end
end
