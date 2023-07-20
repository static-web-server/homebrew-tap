# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.20.1.tar.gz'
  sha256 '9017890135fe11139b96e0b62dba2d8fcabf1db9f89daa2e39a0d206b9301ee5'
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
