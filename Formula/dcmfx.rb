VERSION = "0.6.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "9e8dca7bb2be776dfed85dcbec748d4a1ee2c9b9dc9148c079997464b7cd797c",
  "x86_64-apple-darwin" => "328b3c1d9db680f23a7952ddccda24e73aa0e07cd2c16400a299b71fd3a947ee",
  "aarch64-unknown-linux-musl" => "ea9e5ab9074f709d2bac2420e27ab5e4ad3847f185c548c9816b73742462b188",
  "x86_64-unknown-linux-musl" => "714ff84c5fc2b5277512fa0d3e8a415e5b9a018d643d9f5f4eb850b20715f383"
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
