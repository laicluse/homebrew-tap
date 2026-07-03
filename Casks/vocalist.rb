cask "vocalist" do
  version "1.0.118"
  sha256 "ddc5d6d8fbe08dd45e181b0e887cf6dd5e7182aa8b10744f50bfe86db9c2d272"

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
    If setup appears stuck:
      vocalist plugin install --verbose --timeout-seconds 10
  EOS
end
