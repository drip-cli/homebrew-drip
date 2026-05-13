# Homebrew tap for DRIP

This tap exists so Homebrew users can install the DRIP ecosystem:

```bash
brew tap drip-cli/drip
brew install drip                            # the CLI
brew install --cask dripmeter                # the macOS menu-bar app
```

## What's published

| Package      | Type    | Repo                                                                                | Auto-bumped by                  |
| ------------ | ------- | ----------------------------------------------------------------------------------- | ------------------------------- |
| `drip`       | formula | [`drip-cli/drip`](https://github.com/drip-cli/drip)                                 | `release.yml` on every `vX.Y.Z` tag |
| `dripmeter`  | cask    | [`drip-cli/drip-meter-macos`](https://github.com/drip-cli/drip-meter-macos)         | `release.yml` on every `vX.Y.Z` tag |

`Formula/drip.rb` and `Casks/dripmeter.rb` are **both auto-generated**
by their upstream repos' release workflows. Don't edit them by hand —
your changes will be overwritten on the next release.

## Updating

```bash
brew upgrade drip-cli/drip/drip              # CLI
brew upgrade --cask drip-cli/drip/dripmeter  # macOS app
```

— or run `drip update` from any installed CLI version, which detects
Homebrew automatically.

## DripMeter Gatekeeper warning

DripMeter is currently **ad-hoc signed** (no Apple Developer ID yet),
so macOS Gatekeeper blocks the first launch with "DripMeter cannot be
opened because it is from an unidentified developer". Two ways to
authorise it:

1. **System Settings → Privacy & Security** → scroll to the
   "DripMeter was blocked from opening" message → "Open Anyway".
2. Or drop the quarantine xattr directly:
   ```bash
   xattr -d com.apple.quarantine /Applications/DripMeter.app
   ```

We'll switch to a signed + notarised release once an Apple Developer
Program subscription is wired into the release pipeline.

## License

Apache-2.0 — same as DRIP and DripMeter themselves. © Perform Code SAS.
