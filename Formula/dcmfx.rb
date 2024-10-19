VERSION = "0.1.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "3adfa02bfe8b9b0687e7c7df63f5a59b4fdc164d7bbbfa69978ecacca0475272",
  "x86_64-apple-darwin" => "39c82c2b896bb346a1ffb40eca6eceabd53610c515c148a8ec6588b7375b7ef2",
  "aarch64-unknown-linux-musl" => "f3984aedf4e0c65cd61ed2d30ab95b8641a2f33eaf26331f5285b70e58c42e75",
  "x86_64-unknown-linux-musl" => "cc29fd29c003f2fa869be93a8337529b9b59e1133d28f90fc43c927bddf05658"
}

class Dcmfx < Formula
  desc "DCMfx - CLI tool for working with DICOM and DICOM JSON files"
  homepage "https://github.com/dcmfx"
  version VERSION
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-aarch64-apple-darwin.tar.gz"
      sha256 SHAS.fetch("aarch64-apple-darwin")
    else
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-x86_64-apple-darwin.tar.gz"
      sha256 SHAS.fetch("x86_64-apple-darwin")
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-aarch64-unknown-linux-musl.tar.gz"
      sha256 SHAS.fetch("aarch64-unknown-linux-musl")
    else
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-x86_64-unknown-linux-musl.tar.gz"
      sha256 SHAS.fetch("x86_64-unknown-linux-musl")
    end
  end

  def install
    bin.install("dcmfx")
  end

  test do
    system(bin / "dcmfx", "--version")
  end
end
