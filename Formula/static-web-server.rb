# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.39.0.tar.gz'
  sha256 'da5906ed28eb47ebe6fae782b20a2f99f69c094e7885c66612e2c03d7911631a'
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
