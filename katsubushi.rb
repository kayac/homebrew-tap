class Katsubushi < Formula
  desc 'ID generator server'
  version '2.3.0'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.0/go-katsubushi_v2.3.0_darwin_arm64.tar.gz'
      sha256 '696fc63918c268f475181f1fddd7891e2fd9f5998ad47ceb8eca740c59733dec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.0/go-katsubushi_v2.3.0_darwin_amd64.tar.gz'
      sha256 '8e71fcffe6fca3b3f8ab7d00381d7dda3d40f445fdcdd69dc5d919ad78d65b04'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.0/go-katsubushi_v2.3.0_linux_arm64.tar.gz'
      sha256 '40aa4d7967159856c7681bde7b43e12e4a247084ea0740d2b1e8554ff83bf40f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.0/go-katsubushi_v2.3.0_linux_amd64.tar.gz'
      sha256 '09607230fe3d0ed31c5c45c0831eb8870c9f7412a2b47936e544cecb5750bd71'
    end
  end

  head do
    url 'https://github.com/kayac/go-katsubushi.git'
    depends_on 'go' => :build
  end

  def install
    bin.install 'katsubushi'
  end
end
