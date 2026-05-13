class Drip < Formula
  desc "Delta Read Interception Proxy — sends only file diffs to your LLM agent"
  homepage "https://github.com/drip-cli/drip"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.1/drip-aarch64-apple-darwin.tar.gz"
      sha256 "fc986c075d477183510f6d31fe8ac9013a029fb9b44e934b7e692470267ad456"
    end
    on_intel do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.1/drip-x86_64-apple-darwin.tar.gz"
      sha256 "3e70be57b2ff8aea4d7aca688bd708adc2dcd76e824c83ce975078c3904f6982"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.1/drip-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3eb4638974a64b0ce05dc06b402e3578f20c3ad651fea114132bc658f883f4c6"
    end
    on_intel do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.1/drip-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e1b17464cf2d5d40ef59d82459f8c20bf8439ece690fcb797573fd36d03b140f"
    end
  end

  def install
    bin.install "drip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drip --version")
  end
end
