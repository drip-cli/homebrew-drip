cask "dripmeter" do
  version "0.1.0"
  sha256 "06ab114b62ae123b9a3f0746e73b23bdec83bfc7d7c8cdd38f7f6f72d7933832"

  url "https://github.com/drip-cli/drip-meter-macos/releases/download/v#{version}/DripMeter-v#{version}.zip"
  name "DripMeter"
  desc "Live token-savings meter for DRIP, in your macOS menu bar"
  homepage "https://github.com/drip-cli/drip-meter-macos"

  depends_on macos: ">= :sonoma"

  app "DripMeter.app"

  # DripMeter is ad-hoc signed (no Apple Developer ID yet). Without
  # stripping the quarantine xattr, Gatekeeper blocks the first
  # launch with "Apple cannot check it for malicious software".
  #
  # Strip ONLY `com.apple.quarantine` ONLY on the bundle root —
  # not `-cr` (recursive clear of everything), which crashes on
  # SIP-protected internals like `Contents/_CodeSignature/` and
  # `Contents/MacOS/<binary>`. The quarantine xattr is only ever
  # placed on the top-level bundle dir, so this single call is
  # sufficient.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/DripMeter.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/io.drip-cli.dripmeter",
    "~/Library/Preferences/io.drip-cli.dripmeter.plist",
    "~/Library/Caches/io.drip-cli.dripmeter",
    "~/Library/Saved Application State/io.drip-cli.dripmeter.savedState",
  ]

  caveats <<~EOS
    DripMeter is ad-hoc signed (no Apple Developer ID yet). The cask
    automatically strips the quarantine xattr on install, so the
    first launch should just work. If macOS still complains, run
    (no sudo needed):

      xattr -d com.apple.quarantine /Applications/DripMeter.app
      open /Applications/DripMeter.app

    Pair with the DRIP CLI for live data:
      brew install drip-cli/drip/drip && drip init -g
  EOS
end
