class CanvasDownloader < Formula
  desc "Download and organize all your course materials from Canvas LMS 📚"
  homepage "https://github.com/aik2mlj/canvas-downloader"
  license "GPL-3.0-or-later"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.intel?
      url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b40d3b0586a5fdc9f51927f7107828392dfadcc5f622bcc05f0c5588815969db"
    else
      url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1251315a2f05a227995d855bcb4505ec179b2540aa7268056879e14d0c89d400"
    end
  end
  on_linux do
    url "#{homepage}/releases/download/v#{version}/canvas-downloader-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c32034a7852eb15784bc707438d73200a5a14155b0378a9761b25d9052629abd"
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

