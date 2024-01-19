class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.3.2'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.2/ecspresso_2.3.2_darwin_arm64.tar.gz'
      sha256 'd99bf51fc6bdf3807b451c739b53bb723e2e2804d2b0f295275beed4c2e8aee6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.2/ecspresso_2.3.2_darwin_amd64.tar.gz'
      sha256 'f71cdc1bbf521c12fa35aee9237b4ff0a3442ae67155384af3858681fbab39e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.2/ecspresso_2.3.2_linux_arm64.tar.gz'
      sha256 '37276a2331e95c9871439993624c623d3c4f46ba23a722d1172f8b5275b5e3da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.3.2/ecspresso_2.3.2_linux_amd64.tar.gz'
      sha256 'c99471dd95040fd209cfd3fa57b708f8e20e77a576dc3756343a4535718bfb05'
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
