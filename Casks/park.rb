cask "park" do
  version "0.0.2"

  on_arm do
    sha256 "f5194831ad6fb98003f3b30e65e89f9a7bf5179336df617f3f3efab2a8a731ae"
    url "https://github.com/13shivam/park/releases/download/v#{version}/PARK-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "62f894cc50716f4bafc3eefafcc762481d672d8bb167e81b902c74810fc31424"
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
