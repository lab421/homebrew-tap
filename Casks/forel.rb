cask "forel" do
  version "1.0.7"
  sha256 "38872b17c0a729bdaac310a7036ecba0f9efc01788d54f11ce8b1456b6925ca9"

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
