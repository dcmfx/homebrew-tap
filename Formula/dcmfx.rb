VERSION = "0.14.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "cfd4633d0d5c9f2e775d1da2a065b47010d102d3efff717dc19ba0d3c9db8e96",
  "x86_64-apple-darwin" => "20efd4a6b1c05fe9c9ef17d6d33b300587ca9278150fd4d435e62b042bb19190",
  "aarch64-unknown-linux-musl" => "1e72c076ea2fc244e1f2a181a2f084a2c1145a75d8b83dc62f7ce7f7472d13b7",
  "x86_64-unknown-linux-musl" => "cec3a3243447778bf2d14f33f526bb7a8c7a2fbe68e493aaab99e33dc34d151c"
}

class Dcmfx < Formula
  desc "DCMfx - CLI tool for working with DICOM and DICOM JSON files"
  homepage "https://github.com/dcmfx"
  version VERSION
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-v#{VERSION}-aarch64-apple-darwin.tar.gz"
      sha256 SHAS.fetch("aarch64-apple-darwin")
    else
      url "#{URL_PREFIX}dcmfx-v#{VERSION}-x86_64-apple-darwin.tar.gz"
      sha256 SHAS.fetch("x86_64-apple-darwin")
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-v#{VERSION}-aarch64-unknown-linux-musl.tar.gz"
      sha256 SHAS.fetch("aarch64-unknown-linux-musl")
    else
      url "#{URL_PREFIX}dcmfx-v#{VERSION}-x86_64-unknown-linux-musl.tar.gz"
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
