cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.6"
  sha256 arm:   "3ab5135cb621a0d6b58a47a667df98a93c47bb090f5241d36223f8a7a54b3203",
         intel: "54969df046f20d1c03c0c2113046625c5431a29a0f51f272b32702e77eea055d"

  url "https://github.com/lab421/forel/releases/download/v#{version}/Forel-v#{version}-darwin-#{arch}.dmg"
  name "Forel"
  desc "File-automation app that watches folders and runs rules"
  homepage "https://github.com/lab421/forel"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+\.\d+\.\d+(?:-(?:alpha|beta|rc)\.\d+)?)$/i)
  end

  depends_on macos: :ventura

  app "Forel.app"

  zap trash: [
    "~/Library/Application Support/com.lab421.forel",
    "~/Library/Caches/com.lab421.forel",
    "~/Library/Application Support/com.forel.app",
    "~/Library/Caches/com.forel.app",
  ]
end
