VERSION = "0.14.2"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "055bfbeb83e12b5a13dc5b48054469ee54fc37786f32e1a0cb4b3874e3eea4ce",
  "x86_64-apple-darwin" => "7740577026e6a3a3d25ece747d73eaa0dbbe4cc83a5a7ea64ae43bd9f19c2fd9",
  "aarch64-unknown-linux-musl" => "72a99372cc47f9628ddff01e517e3b00b472c076a07b63550d218b3e1f0cd73f",
  "x86_64-unknown-linux-musl" => "12f885c7e459a86be8e84a1c4945a422ea14cb6a42b721a70153a26b20a7b5f5"
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
