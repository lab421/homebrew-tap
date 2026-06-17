cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0-beta.2"
  sha256 arm:   "3838d340a7dca2408d25d57e785e511727fe08416e6371f3f7fd8f7cd884e304",
         intel: "c3ac0666112367bb84b1549eb4935c327e8a9a431f06cc6dba1b569658a32beb"

  url "https://github.com/forel-app/forel/releases/download/v#{version}/Forel-v#{version}-darwin-#{arch}.dmg"
  name "Forel"
  desc "File-automation app that watches folders and runs rules"
  homepage "https://github.com/forel-app/forel"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+\.\d+\.\d+(?:-(?:alpha|beta|rc)\.\d+)?)$/i)
  end

  depends_on macos: :sonoma

  app "Forel.app"

  zap trash: [
    "~/Library/Application Support/com.forel.app",
    "~/Library/Caches/com.forel.app",
  ]
end
