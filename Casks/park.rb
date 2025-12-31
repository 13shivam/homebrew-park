cask "park" do
  version "1.0.1"

  on_arm do
    sha256 "e5c3ac23f3a8ae1b81a2ee6961f913c77ddc20477cbf210c6110ea0ce62172f1"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "8c7265f1bff30479f70b1990116a27b28386ce3ab82b4c4de0f4ef06d1b7a6c8"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}.dmg"
  end

  name "PARK"
  desc "Parallel Agent Runtime for Kiro - Multi-terminal dashboard for managing Kiro CLI sessions"
  homepage "https://github.com/13shivam/park"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PARK.app"


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
