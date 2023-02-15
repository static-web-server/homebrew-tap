# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, blazing fast and asynchronous web server for static files-serving.'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.14.2.tar.gz'
  sha256 '036bf87f97de806cdb84ec03f0647f2619fc0f1defaa76bcb6b6a1508aa8a3a0'
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
