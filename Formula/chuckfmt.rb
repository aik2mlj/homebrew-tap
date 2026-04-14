class Chuckfmt < Formula
  desc "A fast code formatter for ChucK programming language"
  homepage "https://github.com/aik2mlj/chuckfmt"
  license "GPL-3.0-or-later"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ab1e1137edf7b85db20de2212ca41c5eafd6f04ccfb43ca28c3834336f500523"
    else
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "10367f0b54bcc201542abd0269031a31d4acb4836e0fd2431c118bc7cd9d3523"
    end
  end
  on_linux do
    url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fad1a2c9e7f21af2768335e996ef7aec28f90de8677355b5fd2e5f207fb6a7e8"
  end

  def install
    bin.install "chuckfmt"
  end
end
