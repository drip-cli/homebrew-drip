cask "dripmeter" do
  version "0.1.0"
  sha256 "06ab114b62ae123b9a3f0746e73b23bdec83bfc7d7c8cdd38f7f6f72d7933832"

  url "https://github.com/drip-cli/drip-meter-macos/releases/download/v#{version}/DripMeter-v#{version}.zip"
  name "DripMeter"
  desc "Live token-savings meter for DRIP, in your macOS menu bar"
  homepage "https://github.com/drip-cli/drip-meter-macos"

  depends_on macos: ">= :sonoma"

  app "DripMeter.app"

  zap trash: [
    "~/Library/Application Support/io.drip-cli.dripmeter",
    "~/Library/Preferences/io.drip-cli.dripmeter.plist",
    "~/Library/Caches/io.drip-cli.dripmeter",
    "~/Library/Saved Application State/io.drip-cli.dripmeter.savedState",
  ]

  caveats <<~EOS
    DripMeter is ad-hoc signed (no Apple Developer ID yet). The
    first launch will be blocked by Gatekeeper — open System
    Settings → Privacy & Security and click "Open Anyway", or
    run:

      xattr -d com.apple.quarantine /Applications/DripMeter.app

    Pair with the DRIP CLI for live data:
      brew install drip-cli/drip/drip && drip init -g
  EOS
end
