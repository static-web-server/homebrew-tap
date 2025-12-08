# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.40.1'
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'fbdb678ab2e7886ef20719bde2a929c49ec1b24dc4900f409bd377e49a85dd32'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '58370cc01799c826fc5d3398762c2e6acb5440ab0ec9a289ab9b709e76cff242'

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
      sha256 '0330cd4a6265a96fac4be6620abfd2a892e9ff32f3b8e2de0630b09cb3236f67'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3db363fdb41898a40d9aaba0714e06d0a03513d2cacacf7ee6066222b422f7f"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
