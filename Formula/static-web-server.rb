# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  url 'https://github.com/static-web-server/static-web-server/archive/v2.36.0.tar.gz'
  sha256 'bb99fd25835050e9572ea4589f66b94a64d1724712a2f4881ab35f29d1d8f2a9'
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
