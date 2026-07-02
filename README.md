# laicluse/homebrew-tap

This is the public Homebrew tap for l'Aicluse Mac apps.

A generic tap (not `homebrew-vocalist`) is deliberate: future l'Aicluse Mac apps can add their own cask here without a new repo each time.

## Install

```sh
brew install --cask laicluse/tap/vocalist
vocalist plugin install
```

`brew upgrade` pulls newer published versions.

## Structure

```
Casks/
  vocalist.rb    # the Vocalist cask
```

The cask installs three artifacts: `Vocalist.app`, the `vocalist` CLI, and the bundled `AgentPlugin` marketplace under Homebrew's share directory. The app stays a normal Mac menu-bar app; the explicit `vocalist plugin install` step connects the bundled marketplace to Claude Code and Codex.

## Maintainer notes

- `version` mirrors `CFBundleShortVersionString` in
  `vocalist-swift/Resources/Info.plist`.
- `url` points at the public, notarized DMG asset.
- **`sha256` must be regenerated from the published, notarized Release DMG.** The initial value comes from a local development build and must not be treated as a release checksum.
- `depends_on macos: :tahoe` is Homebrew's minimum-version form (it parses
  with a `>=` comparator), so macOS Tahoe and newer satisfy it.

## Release gate

Do not publish a Vocalist cask update until the DMG is Developer ID signed, notarized, stapled, publicly downloadable, and the cask checksum has been updated from that exact public artifact.
