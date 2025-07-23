VERSION = "0.28.1"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "8c691e29ca49ef7fbef042478d0284fe351a69f943ca997c6de5de6bf46b37ce",
  "x86_64-apple-darwin" => "952ceb90ba7ff942f44663502b5a4a93a82b5b64d507a1118285a81913928d9f",
  "aarch64-unknown-linux-musl" => "fb5978b2dcd37e7411ffb007f340735be7f7239781bfa42f2f6ee22094098670",
  "x86_64-unknown-linux-musl" => "4885829c8a7cfed3a489e5a94f099b0565cfbf7f08a7181ab44142ea806ad773"
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
