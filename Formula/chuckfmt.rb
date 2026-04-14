class Chuckfmt < Formula
  desc "A fast code formatter for ChucK programming language"
  homepage "https://github.com/aik2mlj/chuckfmt"
  license "GPL-3.0-or-later"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3632e433475fd7443536e5e85f457e4fd659fd989d4e0f86efbb4f509fb61aeb"
    else
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9fbd680644a970feafb4fce0ebaef3835ce2442375bfb9acc1b72961ac1c0022"
    end
  end
  on_linux do
    url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd9107d8c9b3f85c9dd04c7f53fafa27f6c14567effaf51fbbe820d73529c601"
  end

  def install
    bin.install "chuckfmt"
  end
end
