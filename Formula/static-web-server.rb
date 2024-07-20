# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.32.1.tar.gz'
  sha256 '771aa43f3bc96334d432e75f31464e1a0d4dcb4aa920c4f58b2339757e929060'
  license any_of: ['MIT', 'Apache-2.0']
  head 'https://github.com/static-web-server/static-web-server.git', branch: 'master'

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install',  *std_cargo_args
  end

  test do
    system "#{bin}/static-web-server", '-V'
  end
end
