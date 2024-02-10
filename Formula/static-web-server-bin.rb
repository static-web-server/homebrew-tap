# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.26.0'
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '305c0b537886b51f53f3dfe7458848b9083807c17626eaaf1925ed09e1bab247'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '44ed652845e41c88091166b89899a888569fcff383c6826ebbc8da3645f05061'

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
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 'e2be439376d925c5069dc2d45d4b5d2cdb58caa13f48a04c203357e0e7ea5b28'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b7fb9c0036300b01c09a21230d786ceb81e5ca08f6b0f63db063cd507c13474"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
