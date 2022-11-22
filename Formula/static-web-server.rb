# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, blazing fast and asynchronous web server for static files-serving.'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.14.0.tar.gz'
  sha256 'b430f5e43e3017aebc2839277aeabf2e79fe4ad75c57b19cc9fea47b9d4457ea'
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
