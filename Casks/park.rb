cask "park" do
  version "1.0.1"

  on_arm do
    sha256 "08affb1ac0019ed63ebbbb3bb1adf910fea935c00e510e2ae6de8a741bdfe952"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "e5dd521126e0f5b809b29b637e9b65ec7149a928005760a26db77cf009a01377"
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
