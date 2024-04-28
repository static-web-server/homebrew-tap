# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.30.0'
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '0b5aef1f4593d3df33dda7a79b74867ea0a393c829d0fac837c1f55192a0d405'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '6c63a388e421e3c533bb1efc691a1ba08b9b2a93a1f85824979c2a93c93ef3d6'

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
      sha256 '5a3283efc33f3ffe8b16c98dfef8130a7fbf77bd23cfe5275f86215f4ffdb600'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f31efb4838222335c4a1d9aec1420c67574c7babce3cc28956c502cd2523882b"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
