cask "dripmeter" do
  version "0.1.1"
  sha256 "5e4de3e9fa1f0464a78bef167ec6f654c49c0dd89acdda12c0ce325b49ce6939"

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
    strips the quarantine xattr on install, but macOS Sequoia/Tahoe
    (15.x / 26.x) still asks Gatekeeper to verify the app on first
    launch and rejects it because there's no Developer ID.

    First launch — do this ONCE:
      1. Open Finder → Applications.
      2. Control-click (or right-click) DripMeter.app → Open.
      3. In the "cannot verify" dialog, click Open Anyway.
      macOS whitelists the app after that; double-clicking it works
      normally from then on.

    Alternative (System Settings):
      Privacy & Security → scroll to the DripMeter notice →
      Open Anyway.

    Pair with the DRIP CLI for live data:
      brew install drip-cli/drip/drip && drip init -g
  EOS
end
