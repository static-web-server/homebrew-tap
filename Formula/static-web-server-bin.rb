# typed: false
# frozen_string_literal: true

class StaticWebServerBin < Formula
  version '2.35.0'
  desc 'A cross-platform, high-performance and asynchronous web server for static files-serving.'
  homepage 'https://static-web-server.net/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'static-web-server'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'bebed68f1bf2c044a5bf6ffa30afae34694ca2009c6df2ff9968f5a0221ecb0e'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '4a4a9536c9b420ac2db6ac6018416785aeae4bc9b6e884edeb295493ce313deb'

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
      sha256 'f4c65b17c1f5ba02e1954861f8a164520f52fb3dadd16eea4edf51b738a8e9bd'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/static-web-server/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92e34f7ceaef3d5eef0601e8b2b5fb6bb95fb7a004bf5147495cb3dfc6e8934d"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
