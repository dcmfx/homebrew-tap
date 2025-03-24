VERSION = "0.13.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "32b93734edb5217c62a70ec97cf5bb352f0cabcf9f4f5514c58d5434f6a29b79",
  "x86_64-apple-darwin" => "5a98c25bdbf13a01eca6b9b70a9756ac95f03f653a4dcd0a1a06cdbf8350dc13",
  "aarch64-unknown-linux-musl" => "cc62379e1aecf548d2cd1538a7132095f2cac3e5cf4c0add279dde42fbf38e46",
  "x86_64-unknown-linux-musl" => "ced8cb288f21e22bca946aa89e1897ad3b61e982f0ece7a2f1c7a475006effef"
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
