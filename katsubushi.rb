class Katsubushi < Formula
  desc 'ID generator server'
  version '2.2.1'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.1/go-katsubushi_v2.2.1_darwin_arm64.tar.gz'
      sha256 '5f126852ff6f4b3613375c86ddcd51f59fe918e623b14452dddb36110e3c13cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.1/go-katsubushi_v2.2.1_darwin_amd64.tar.gz'
      sha256 'aa1aa6e23bcf5407bce782f34f957c2d42a7ed6690bb9f25188b076f43533519'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.1/go-katsubushi_v2.2.1_linux_arm64.tar.gz'
      sha256 'ec23a05acb2b268dfa34a9989d74cfbcbb4b1f631ac082aa5ad53f3af5f12134'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.2.1/go-katsubushi_v2.2.1_linux_amd64.tar.gz'
      sha256 '4b34c6c8a2d0a14678864876f75e85c90402e9b9e5cdd7d0150a8537403ea5e2'
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
