class Gunfish < Formula
  version '0.4.1'
  homepage 'https://github.com/kayac/gunfish'
  if OS.mac?
    url "https://github.com/kayac/Gunfish/releases/download/v0.4.1/gunfish-v0.4.1-darwin-amd64.zip"
    sha256 'cadad30566cfd4a9190411b981b483b1ab6e153fbe22a97b40674c17875ca4ec'
  end
  if OS.linux?
    url "https://github.com/kayac/Gunfish/releases/download/v0.4.1/gunfish-v0.4.1-linux-amd64.zip"
    sha256 '23f3ca1c18664079fc4142b42112eeabef5af4ddf127f56b54dc34fbc7329b85'
  end
  head 'https://github.com/kayac/gunfish.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system 'mv gunfish-v*-*-amd64 gunfish'
    bin.install 'gunfish'
  end
end
