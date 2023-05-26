class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.2.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.0/ecspresso_2.2.0_darwin_arm64.tar.gz'
      sha256 '227852315550d3ca131e3fc69d568509f4e62a6288de57a136ec4382f8bbea7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.0/ecspresso_2.2.0_darwin_amd64.tar.gz'
      sha256 '5125f877fbd9eea7ef245c6312ae603d262c12df75eae5201e1925b91eb10a18'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.0/ecspresso_2.2.0_linux_arm64.tar.gz'
      sha256 '2b53a9a46625e34b24301c0fcb823d481f971ea8121c0718bb721e287765bc7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.2.0/ecspresso_2.2.0_linux_amd64.tar.gz'
      sha256 '73f2054af3dd2d966cce24c13ad05da31b82123551235d8f6a2ea67d92f6e147'
    end
  end

  head do
    url 'https://github.com/kayac/ecspresso.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'cmd/ecspresso/ecspresso'
      system 'mv', 'cmd/ecspresso/ecspresso', '.'
    end
    bin.install 'ecspresso'
  end
end
