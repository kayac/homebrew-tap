class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.0/ecspresso_2.3.0_darwin_arm64.tar.gz'
      sha256 '517cbadf8d68067fe6eb0caf7b79088d36d50fb0452b885056164ddc6fc54cd1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.0/ecspresso_2.3.0_darwin_amd64.tar.gz'
      sha256 'd973a3c1d5f45632e3bbb3bbf76b28e6298cf1d9b3d6141731697ea0f79ae689'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.0/ecspresso_2.3.0_linux_arm64.tar.gz'
      sha256 '127dcf697bcc6eb1e5548893f49a52420b8b35e5bb17309425597d512963cda4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.0/ecspresso_2.3.0_linux_amd64.tar.gz'
      sha256 '2f2450ca495cb45224ef2445c954855cab6b3caec50e6ad843365765c9f13bdb'
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
