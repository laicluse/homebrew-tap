cask "vocalist" do
  version "7.0.0"
  sha256 "7f78013695460c4af73585f93a9bf4f06b9a790e421b51775ba74b96fb224a94"

  url "https://github.com/laicluse/vocalist-releases/releases/download/v#{version}/Vocalist-#{version}.dmg",
      verified: "github.com/laicluse/vocalist-releases/"
  name "Vocalist"
  desc "Hands-free prompting for CMUX coding-agent sessions"
  homepage "https://laicluse.com/vocalist/"

  depends_on macos: :tahoe

  app "Vocalist.app"
  binary "vocalist"
  artifact "AgentPlugin", target: "#{HOMEBREW_PREFIX}/share/vocalist/plugin"

  zap trash: [
    "~/Library/Caches/com.epologee.Vocalist",
    "~/Library/Preferences/com.epologee.Vocalist.plist",
    "~/Library/Saved Application State/com.epologee.Vocalist.savedState",
  ]

  caveats <<~EOS
    Connect the coding-agent plugin after install:
      vocalist plugin install
  EOS
end
