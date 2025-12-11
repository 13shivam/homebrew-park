cask "park" do
  version "v1.0.0"

  on_arm do
    sha256 "2401ba253f94532fcc7800d80acba980e6c459d052df32867a2abec1541e9b06"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 ""
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-x64.dmg"
  end

  name "PARK"
  desc "Parallel Agent Runtime for Kiro - Multi-terminal dashboard for managing Kiro CLI sessions"
  homepage "https://github.com/13shivam/park"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PARK.app"

  binary "#{appdir}/PARK.app/Contents/MacOS/PARK", target: "park"

  postflight do
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", 
                          "#{appdir}/PARK.app"]
  end

  uninstall quit: "com.park.agent-launcher"

  zap trash: [
    "~/Library/Application Support/PARK",
    "~/Library/Preferences/com.park.agent-launcher.plist",
    "~/Library/Logs/PARK",
    "~/.park-agent-launcher"
  ]
end
