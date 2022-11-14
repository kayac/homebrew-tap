class Ecspresso < Formula
  desc 'ecspresso is a deployment tool for Amazon ECS'
  version '1.7.14'
  homepage 'https://github.com/kayac/ecspresso'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.14/ecspresso_1.7.14_darwin_arm64.tar.gz'
      sha256 '60de61f14111acbae24e0d3c32847935fc704f231dc9cd983435349527d84f78'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.14/ecspresso_1.7.14_darwin_amd64.tar.gz'
      sha256 'bba9f47e76c9c9b0d6ceab735b76eea1f5eb7a550c8a4947f4999bca0eec9e13'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.14/ecspresso_1.7.14_linux_arm64.tar.gz'
      sha256 '51c24a8f224d0a4e0ac08e78d6db2307212ee46d561473d3b89aec49833724a4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/kayac/ecspresso/releases/download/v1.7.14/ecspresso_1.7.14_linux_amd64.tar.gz'
      sha256 '4562579c5bba7acd46c294eaac8a57be596afe80c79c9c3c1649a9e02958223b'
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
