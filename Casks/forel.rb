cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  sha256 arm:   "b959a97a5493736a6862c80f865def5cc8dce20cc06478eb3d767b8d7e72cfc9",
         intel: "8810f9bc744da905f0c04af07855173be0452da4a130eed9c2485dfff8859a4b"

  url "https://github.com/lab421/forel/releases/download/v#{version}/Forel-v#{version}-darwin-#{arch}.dmg"
  name "Forel"
  desc "File-automation app that watches folders and runs rules"
  homepage "https://github.com/lab421/forel"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+\.\d+\.\d+(?:-(?:alpha|beta|rc)\.\d+)?)$/i)
  end

  depends_on macos: :sonoma

  app "Forel.app"

  zap trash: [
    "~/Library/Application Support/com.lab421.forel",
    "~/Library/Caches/com.lab421.forel",
    "~/Library/Application Support/com.forel.app",
    "~/Library/Caches/com.forel.app",
  ]
end
