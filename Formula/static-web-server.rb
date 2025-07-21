# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.38.0.tar.gz'
  sha256 '8f806542cd67f192610b2187cf6eb2fd0f0736309bf639af9fb6cb6a13d03d85'
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
