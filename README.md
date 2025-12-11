# Homebrew Tap for PARK

Official Homebrew tap for [PARK](https://github.com/13shivam/park) - Parallel Agent Runtime for Kiro.

![PARK_demo.gif](PARK_demo.gif)

## Installation

```bash
brew tap 13shivam/park
brew install --cask park
```

## What is PARK?

PARK is a desktop application with a multi-terminal dashboard for managing and monitoring Kiro CLI sessions with support for both interactive and non-interactive modes.

For more information, visit the [main repository](https://github.com/13shivam/park).

## Updating the Cask

After each release of PARK:

1. Download the DMG files from the [releases page](https://github.com/13shivam/park/releases)
2. Calculate SHA256 checksums:
   ```bash
   shasum -a 256 PARK-1.0.0-arm64.dmg
   shasum -a 256 PARK-1.0.0-x64.dmg
   ```
3. Update `Casks/park.rb` with new version and checksums
4. Commit and push changes

## License

MIT License - see [LICENSE](https://github.com/13shivam/park/blob/main/LICENSE) file for details.
