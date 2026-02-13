class CanvasDownloader < Formula
  desc "Download and organize all your course materials from Canvas LMS 📚"
  homepage "https://github.com/aik2mlj/canvas-downloader"
  license "GPL-3.0-or-later"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "def4d1bdc51f89ac338337b6891afa19cf2b7d40b7a868c7ca7397080dc8206a"
    else
      url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9f48cb9aa36c7629a8dd56c8f1d9858e3394225213cb1c2eaf9dafdde9a2f14d"
    end
  end
  on_linux do
    url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "23c831b3883f294e2d77ca6d5d6d450c75371deb167118e8d6647b7f35bb7027"
  end

  def install
    bin.install "canvas-downloader"

    bash_output = Utils.safe_popen_read(bin/"canvas-downloader", "completions", "bash")
    zsh_output  = Utils.safe_popen_read(bin/"canvas-downloader", "completions", "zsh")
    fish_output = Utils.safe_popen_read(bin/"canvas-downloader", "completions", "fish")

    (bash_completion/"canvas-downloader").write bash_output
    (zsh_completion/"_canvas-downloader").write zsh_output
    (fish_completion/"canvas-downloader.fish").write fish_output
  end

  test do
    assert_match "canvas-downloader", shell_output("#{bin}/canvas-downloader --help")
  end
end

