VERSION = "0.1.0"
URL_PREFIX = "https://github.com/dcmfx/dcmfx/releases/download/v#{VERSION}/"

class Dcmfx < Formula
  desc "DCMfx - CLI tool for working with DICOM and DICOM JSON files"
  homepage "https://github.com/dcmfx"
  version VERSION
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-aarch64-apple-darwin.tar.gz"
      sha256 "d3f3762b1bc947146390b564708243cbcc383820bae75aac639b261bcc40658d"
    else
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-x86_64-apple-darwin.tar.gz"
      sha256 "2234d7aa5affb7cb4ef4efc9f16de2f16ac8858c868fc36b2f78b8bfe7508f5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "479ffcfd83186da09f6e337c148f83f147ad45931b5e469a912a5c2ab9600944"
    else
      url "#{URL_PREFIX}dcmfx-cli-v#{VERSION}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a957132eee10cf69434c08851aee9fa1a8a6ede850377cfcaef7011ab9e642c"
    end
  end

  def install
    bin.install("dcmfx")
  end

  test do
    system(bin / "dcmfx", "--version")
  end
end
