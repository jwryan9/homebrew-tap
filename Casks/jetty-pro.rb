cask "jetty-pro" do
  version "1.0.3"
  sha256 "f8b0005d5b6611ccdb4a7437600a6e30aac25f859cda44bf671a511c60cb776b"

  url "https://hypercritical.co/jetty-pro/downloads/Jetty%20Pro.zip"
  name "Jetty Pro"
  desc "Customizable Dock-like floating palettes for files, folders and apps"
  homepage "https://hypercritical.co/jetty-pro/"

  livecheck do
    url "https://hypercritical.co/jetty-pro/updates/appcast.xml"
    strategy :sparkle do |items|
      items.reject(&:channel).map(&:short_version).first
    end
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Jetty Pro.app"

  zap trash: [
    "~/Library/Application Support/co.hypercritical.JettyPro",
    "~/Library/Caches/co.hypercritical.JettyPro",
    "~/Library/Preferences/co.hypercritical.JettyPro.plist",
  ]
end
