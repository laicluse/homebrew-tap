cask "vocalist" do
  version "1.0.110"
  sha256 "563e77fcc79192a73d3e5222b055824885b44099ebd5ad3583790351ef25bf2c"

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
