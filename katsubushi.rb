class Katsubushi < Formula
  version '1.6.0'
  homepage 'https://github.com/kayac/go-katsubushi'
  if OS.mac?
    url "https://github.com/kayac/go-katsubushi/releases/download/v1.6.0/katsubushi-1.6.0-darwin-amd64.zip"
    sha256 'e1dace2406c241af0e242981a95cc993cb282d375fe02263e6f67957b0eff5db'
  end
  if OS.linux?
    url "https://github.com/kayac/go-katsubushi/releases/download/v1.6.0/katsubushi-1.6.0-linux-amd64.zip"
    sha256 '8eecf5d8456d748fa7895211cbee103c295f725db0c51d89d0185c44009d2478'
  end
  head 'https://github.com/kayac/go-katsubushi.git'

  def install
    bin.install 'katsubushi'
  end
end
