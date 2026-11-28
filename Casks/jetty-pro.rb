cask "jetty-pro" do
  version "1.0.5"
  sha256 "fb75dc132b0d3260c5510e7d019f297c75a0a18de2a620f42e9f8110afb85c3c"

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
