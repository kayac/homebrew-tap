class Katsubushi < Formula
  desc 'ID generator server'
  version '2.0.2'
  homepage 'https://github.com/kayac/go-katsubushi'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.2/go-katsubushi_v2.0.2_darwin_arm64.tar.gz'
      sha256 'd8b806bc5f9f3474e776175c6cd22165d27de4a38f867ac9b4bf316b5b71407d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.2/go-katsubushi_v2.0.2_darwin_amd64.tar.gz'
      sha256 'f5fe5eac01c0665bb8b0ccd3366aecc4abf22c3ac62c64822b9f34770f52f469'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.2/go-katsubushi_v2.0.2_linux_arm64.tar.gz'
      sha256 '856d2f64dbdb7b6cee249fc003268853b02a9a8fc0f6130a32f7bcd73af1341c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/go-katsubushi/releases/download/v2.0.2/go-katsubushi_v2.0.2_linux_amd64.tar.gz'
      sha256 'cfbe0ac19eeff34cf2262ab833f24f7adc0b70eee233a7959db2d0977f81f900'
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
