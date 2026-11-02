cask "forel" do
  version "1.1.1"
  sha256 "d93cac43d25069da6ecb32ab971ef62c0a4e86fb0ba8baa8ef3f585caacd74d6"

  url "https://github.com/lab421/forel/releases/download/v#{version}/Forel-v#{version}.dmg"
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
