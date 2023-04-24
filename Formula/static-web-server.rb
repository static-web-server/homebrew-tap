# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.16.0.tar.gz'
  sha256 '51f994111a10c3e86ab48a3c1bf5024901386d11962aca5f3c759eeb0c853844'
  license any_of: ['MIT', 'Apache-2.0']
  head 'https://github.com/static-web-server/static-web-server.git', branch: 'master'

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/static-web-server", '-V'
  end
end
