# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A blazing fast and asynchronous web server for static files-serving'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/joseluisq/static-web-server/archive/v2.13.1.tar.gz'
  sha256 'f5001880e292891ca822e53a71266e5f91f103a2a0032bf2b49685ce5c8577d4'
  license any_of: ['MIT', 'Apache-2.0']
  head 'https://github.com/joseluisq/static-web-server.git', branch: 'master'

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
