VERSION = "0.24.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

SHAS = {
  "aarch64-apple-darwin" => "196f269e1fa54d9ac2e67df04554dcbc7908cfa60c1ec77777c01538eb390d18",
  "x86_64-apple-darwin" => "5e56298bda4b111572fe7a0696c371f28b1522c5623ff17bd4bb38ff6800a03a",
  "aarch64-unknown-linux-musl" => "e2f2cf16dd6245bf2f16a85ac26b9fbb0648289e4d0fda7f10fb70608e150b7a",
  "x86_64-unknown-linux-musl" => "77ca10d1bfa4d09b1843a3cbbcf15ca0bc60431fc2ea79103e2b67ea7ecbbaf0"
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
