VERSION = "0.5.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "e852b18cb3426eb5da5df590bb28a2b1646a4a4e6f3bfbd99f5d914d62546c5d",
  "x86_64-apple-darwin" => "5ae8b9bbe523f52ca58ed4d22201113c19f73d3831664e9802ebf22fb97e0e81",
  "aarch64-unknown-linux-musl" => "188adbb27faecff6c28ded4d6fa59577f0fe0f20253f539a929367b3605d3788",
  "x86_64-unknown-linux-musl" => "69058f8c3d5d6389a236bb6abc8fe62d60b3e98f22305bb1ba9b966975da878a"
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
