class Gunfish < Formula
  version '0.4.2'
  homepage 'https://github.com/kayac/gunfish'
  if OS.mac?
    url "https://github.com/kayac/Gunfish/releases/download/v0.4.2/gunfish-v0.4.2-darwin-amd64.zip"
    sha256 '700ae93f0e75aee7922b471278963c3685ccc00a96ce8bb8acee5a9977e58c6a'
  end
  if OS.linux?
    url "https://github.com/kayac/Gunfish/releases/download/v0.4.2/gunfish-v0.4.2-linux-amd64.zip"
    sha256 '4c5f2743d9ba751fd22f4bfb779eef52d0243923ba36072bf89528f5c717fc37'
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
