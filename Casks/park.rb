cask "park" do
  version "1.0.2"

  on_arm do
    sha256 "af2f523e459f8b2c24512966d01f156b62bae7c9f477ec3e1af06356b513216b"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "bea294befe577b1637b5a92c17bf21b56a34ce5f7d9974671e23cd021171679f"
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
