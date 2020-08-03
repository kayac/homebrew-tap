class Katsubushi < Formula
  version '1.6.0'
  homepage 'https://github.com/kayac/go-katsubushi'
  url "https://github.com/kayac/go-katsubushi/releases/download/v1.6.0/katsubushi-1.6.0-darwin-amd64.zip"
  sha256 'e1dace2406c241af0e242981a95cc993cb282d375fe02263e6f67957b0eff5db'
  head 'https://github.com/kayac/go-katsubushi.git'

  def install
    bin.install 'katsubushi'
  end
end
