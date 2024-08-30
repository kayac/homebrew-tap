class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '2.4.1'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_darwin_arm64.tar.gz'
      sha256 '5df074b836222c948f5d70ebcc9a4fbcc092eb78933c10dd984e7706e2682e0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_darwin_amd64.tar.gz'
      sha256 'b7ed16a9982019e71621e6e071a02606c33beb104ad369c5cd1d29e02c993209'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_linux_arm64.tar.gz'
      sha256 '5e3ab0f8ab8719f0ed3681767197932d39a8df33360663917c951493f2f4720e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v2.4.1/ecspresso_2.4.1_linux_amd64.tar.gz'
      sha256 '6bef01cb1733a6677e3cc897df2ed4ceac2e5c86e3bfa995f579154dbc0e08ea'
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
