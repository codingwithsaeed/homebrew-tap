cask "shortcut-divan" do
  version "1.1.1"
  sha256 "138a5915679d8c42ab7e758e0ff1d624bb5f1214aa0184e9892cd387f77c5222"

  url "https://github.com/codingwithsaeed/shortcut-divan/releases/download/v#{version}/Shortcut-Divan-#{version}.dmg"
  name "Shortcut Divan"
  desc "Keyboard shortcuts in a desktop widget"
  homepage "https://github.com/codingwithsaeed/shortcut-divan"

  depends_on macos: :sonoma

  app "Shortcut Divan.app"

  # Signed ad hoc, without an Apple Developer ID: without this, macOS refuses to open it the
  # first time. The widget registers when the app first opens.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Shortcut Divan.app"],
                          must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Shortcut Divan",
    "~/Library/Containers/io.github.codingwithsaeed.shortcutdivan.widget",
    "~/Library/Preferences/io.github.codingwithsaeed.shortcutdivan.plist",
  ]
end
