# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.10.0'
  desc 'A blazing fast and asynchronous web server for static files-serving'
  homepage 'https://sws.joseluisq.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'f595adbf7fc814300dd81628e00b8b062671a1b8df817d1b35f985ef10c517a3'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'bea777b3654c218bf385ce1c225d405df3e4749a3e6b98f7ace560afd19e05a6'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 '141869e36d034e1444e6d58b1f1e550662027d3c520bb4c6fdbf603a22421492'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10b932ead496965599542decd00a5ca17540b4b5b19403f8df5ed43339294b52"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
