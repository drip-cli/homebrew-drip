class Drip < Formula
  desc "Delta Read Interception Proxy — sends only file diffs to your LLM agent"
  homepage "https://github.com/drip-cli/drip"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.0/drip-aarch64-apple-darwin.tar.gz"
      sha256 "6d30eca3f88062db6b13861490d3f943825fcc22b691bbe1b42fd94a557ae854"
    end
    on_intel do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.0/drip-x86_64-apple-darwin.tar.gz"
      sha256 "64ccc7943d879ef2c862639603ec4a071eea4837c1f156cda79e982bd9ede316"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.0/drip-aarch64-unknown-linux-musl.tar.gz"
      sha256 "95dc238ddbc095f7c0d2c55674ed791cc81499304b7da185aea3dbaf4c894d4b"
    end
    on_intel do
      url "https://github.com/drip-cli/drip/releases/download/v0.1.0/drip-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5d93ead7d0ec2963148fdedc37d11bb61a026ffc5995f369bf156fd16b7e5c4b"
    end
  end

  def install
    bin.install "drip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drip --version")
  end
end
