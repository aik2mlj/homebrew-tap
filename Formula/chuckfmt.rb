class Chuckfmt < Formula
  desc "A fast code formatter for ChucK programming language"
  homepage "https://github.com/aik2mlj/chuckfmt"
  license "GPL-3.0-or-later"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "97ae98a5f7459a8ce6ea86b6168832b0209669680b0fe074ebe4e17998b8d5ba"
    else
      url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "72d4c4c503f4d99c61f97473b74fcab0d72386561fc081f6eac504b035184d8e"
    end
  end
  on_linux do
    url "#{homepage}/releases/download/v#{version}/chuckfmt-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f38cff90502ed7c5518d23c3cc3bbcc3e66df4f91bf5c43c6c214c5d43dfed91"
  end

  def install
    bin.install "chuckfmt"
  end
end
