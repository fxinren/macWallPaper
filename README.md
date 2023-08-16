# macWallPaper
Changing macOS wall paper periodically with Apple script &amp; Launchctl

## Usage

### fix some config

File: _chgWallPaper.scpt

```bash
    -- to config images folder location
	set wallPaperDir to homeDir & "/path/to/all/your/wall-paper/images"
```

File: com.wallpaperhelper.plist

```bash
    <string>/path/to/_chgWallPaper.scpt</string>


 	<key>StandardOutPath</key>
	<string>/path/to/logs-files/wallpaper_std.log</string>
	<key>StandardErrorPath</key>
	<string>/path/to/logs-files/wallpaper_err.log</string>

    <!-- which user will use this script -->
	<key>UserName</key>
	<string>who</string>
```

### load launchctl service

```bash
# To start service
launchctl load -w 'com.wallpaperhelper.plist'
launchctl start 'com.wallpaperhelper.plist'

# To unload and stop service
launchctl unload -w 'com.wallpaperhelper.plist'
launchctl load -w 'com.wallpaperhelper.plist'
```
