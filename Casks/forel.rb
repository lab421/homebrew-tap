cask "forel" do
  version "1.1.0"
  sha256 "2d7cda993b69ea794dd64a80c737d9cd5bc5d1d46e4dfa09c5cb382148ced7d5"

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
