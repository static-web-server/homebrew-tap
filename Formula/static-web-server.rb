# typed: false
# frozen_string_literal: true

class StaticWebServer < Formula
  desc 'A blazing fast and asynchronous web server for static files-serving'
  homepage 'https://sws.joseluisq.net/'
  url 'https://github.com/joseluisq/static-web-server/archive/v2.12.0.tar.gz'
  sha256 '4e683bd5486aa11db5ff328feb04a4ef99b5168430c3db4f050ac073eb383859'
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
