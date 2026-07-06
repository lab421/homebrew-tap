cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.5"
  sha256 arm:   "d560d726e8bdd9061f2e10008ccf7dcc42b0c2e95b5f8e78d2ac91b4e8742e21",
         intel: "62c41c610490ae5a93741466dd28581d790dd2cb04ba34b439e0f8b55cb30aac"

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
