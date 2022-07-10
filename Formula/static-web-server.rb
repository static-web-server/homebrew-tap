# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A blazing fast and asynchronous web server for static files-serving'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/joseluisq/static-web-server/archive/v2.10.0.tar.gz'
  sha256 '67a3c46007101c6de2bb81d1113261ead52a91ad805e0f52a9cfb798e1e87936'
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
