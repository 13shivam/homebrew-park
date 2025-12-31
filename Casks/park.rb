cask "park" do
  version "1.0.0"

  on_arm do
    sha256 "e28779edc1230466c50cc0973e9fc113fba78b12e54abdac2f76ad9a3d4432fe"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "edb9930a23c9a5a5c6bf56ac7091d07e94abeb96f2f5c4539b2ee89f8eacd75c"
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
