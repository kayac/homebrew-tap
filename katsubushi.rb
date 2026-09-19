class Katsubushi < Formula
  desc 'ID generator server'
  version '2.3.1'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.1/go-katsubushi_v2.3.1_darwin_arm64.tar.gz'
      sha256 'a1c796a4037bd228371e6bc11c12f49704d3104a4618914f3f9036dc67e1a550'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.1/go-katsubushi_v2.3.1_darwin_amd64.tar.gz'
      sha256 '312702717c7147d28a435cd47a804883f64d0ef63bb5b769dadc09a0c83ec85c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.1/go-katsubushi_v2.3.1_linux_arm64.tar.gz'
      sha256 'aff88643e12cbf3ae1a9d6ed2f3a15fc25fbe8d1e889f12ed7299a44f836fda2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.3.1/go-katsubushi_v2.3.1_linux_amd64.tar.gz'
      sha256 '5cbb440887eb570f822d96ba82e89f8a33e8acae853362f7dcace02cf431dc94'
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
