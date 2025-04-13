VERSION = "0.16.1"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "8e60ab7e8db39a17f0f2ce9a41fa83d31d50c2db7c3ef2c1390818fcb5fed923",
  "x86_64-apple-darwin" => "44601343c66b7873639c882d08ea601f64b630b1019c21b11b3596fe032f7b92",
  "aarch64-unknown-linux-musl" => "bda6bd76749e1b2814dde66b797848f51c9389046b54922f5b11a8022e167e57",
  "x86_64-unknown-linux-musl" => "261d1f4f18843fac9f60091eeba7883150c8acab7330c805bafc7fb85ef59435"
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
