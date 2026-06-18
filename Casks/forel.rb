cask "forel" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0-beta.3"
  sha256 arm:   "614ec3d1c099b3514f31f69766aa8439a49c1b372e85876144c371c1530bd032",
         intel: "f84e21eceb2e21564e41bfe3e0fb2bdf8d35a1ee6efc60f6daf41288a602e21b"

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
