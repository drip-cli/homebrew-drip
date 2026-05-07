# Homebrew tap for DRIP

This tap exists so Homebrew users can install [DRIP](https://github.com/drip-cli/drip):

```bash
brew tap drip-cli/drip
brew install drip
```

`Formula/drip.rb` is **auto-generated** on every release by the
`update-homebrew` job in the main repo's
[`release.yml`](https://github.com/drip-cli/drip/blob/main/.github/workflows/release.yml).
Don't edit it by hand — your changes will be overwritten on the
next release.

## Updating DRIP

```bash
brew upgrade drip-cli/drip/drip
```

— or run `drip update` from any installed version, which detects
Homebrew automatically.

## License

MIT — same as DRIP itself. © Hugo Barbosa & Maxence Bombeeck.
