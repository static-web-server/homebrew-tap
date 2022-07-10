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
      sha256 'da863edda7b3bc87ca01f24bda3ba16bec52422c7c8bdf71517fe53398e53e46'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'b508dec41540222b6712eeec20c458d2e295562db5bed151bf30cc7d6201fbc1'

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
      sha256 '20205a7d40d2fad9c9665517937af0ae942e864a0a0f7d925aab89478e0179d4'

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/static-web-server/releases/download/v#{version}/static-web-server-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3972c627550bb94ee421f88565ad34955a40cd6bab4106bfeeae1ffddbf16a2d"

      def install
        bin.install 'static-web-server'
      end

      test do
        system "#{bin}/static-web-server", '-V'
      end
    end
  end
end
