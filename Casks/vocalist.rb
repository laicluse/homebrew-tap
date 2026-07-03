cask "vocalist" do
  version "1.0.109"
  sha256 "1ed3fb3de9b9e4ae2b7f81b7888e171803a5414785c5bf4468a92acf789ef165"

  url "https://github.com/laicluse/vocalist-releases/releases/download/v#{version}/Vocalist-#{version}.dmg",
      verified: "github.com/laicluse/vocalist-releases/"
  name "Vocalist"
  desc "Hands-free prompting for coding-agent sessions"
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
