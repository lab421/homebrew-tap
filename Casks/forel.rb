cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.2"
  sha256 arm:   "6d44bec13c94fe8f74705914e35960a8d124ee85e3e71c174c8eb73138a4e07a",
         intel: "4adf68d5acc73615c327930ac9cced799de08a77892f6ff5d8d928e7ca8f31d9"

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
