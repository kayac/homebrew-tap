class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.0.0'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.0/ecspresso_2.0.0_darwin_arm64.tar.gz'
      sha256 '6e72e66af65c43bfa128b51cd2846a9fe4499f3ed44774128898b02b31cea094'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.0/ecspresso_2.0.0_darwin_amd64.tar.gz'
      sha256 'cc591f01771c45326249a786d3a8c092d7a597d10d60a6940a83327bfca58429'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.0/ecspresso_2.0.0_linux_arm64.tar.gz'
      sha256 '1964dc33fc0909d8d894a57ba1b237cd4981750f8bbfbbcdf16ae51f00e5cf81'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.0.0/ecspresso_2.0.0_linux_amd64.tar.gz'
      sha256 'b1f5b02f44ae633955c1896311354f1af8e0f67b7e745c9832a1f1d9a2978f63'
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
