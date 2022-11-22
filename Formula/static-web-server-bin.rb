# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.14.0'
  desc 'A cross-platform, blazing fast and asynchronous web server for static files-serving.'
  homepage 'https://sws.joseluisq.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '42537ab0269349891a2f5b4e00c84ae489596a2cdb09122de10c49c87a4bb39a'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '454b6914ccbdecf7c97a40dd39de9c972acae23d3ec6a16d7d997dc26469ad58'

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
      sha256 '3740c9e874c511c8cd7e2b02c03a4172750f094947c7ce7dcb809b8f895f40b9'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60bb0ec7acbfcbeac01713a80ffa4f0480cf8a8cc07ee8ea77cf9c73802827a3"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
