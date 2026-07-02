cask "vocalist" do
  version "1.0.105"
  sha256 "ebd2176c4983c52f400e8ed92cbf2e7d075bbce20d8f8847802492088454fbbc"

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
