[//]: # (## 1.9.1 &#40;2023-05-01&#41;)

[//]: # ()
[//]: # (- feat: add folder should include the folder itself)

[//]: # (- fix: handle file names with special characters in link share mode)

[//]: # (- fix&#40;android&#41;: fix status bar icon color after picking a media file)

[//]: # (- fix&#40;linux&#41;: add libayatana-appindicator3-1 to AppImage dependencies)

[//]: # (- feat: directory share)

[//]: # (- feat: share via browser link &#40;for non-WorqSend users&#41;)

[//]: # (- feat: add "delete from history" button when file could not be opened)

[//]: # (- feat: close message request when copied / opened link)

[//]: # (- feat: slightly improve transfer speed)

[//]: # (- feat: implement WorqSend protocol v2 with v1 fallback)

[//]: # (- feat: scan &#40;sync&#41; button automatically scans all network interfaces when count < 3)

[//]: # (- feat&#40;android, ios&#41;: add "Save to gallery" setting button in file receive options)

[//]: # (- feat&#40;desktop&#41;: move troubleshoot out of navigation into send page)

[//]: # (- feat&#40;desktop&#41;: save last window position &#40;by @TheGB0077&#41;)

[//]: # (- feat&#40;android&#41;: enable edge-to-edge mode)

[//]: # (- feat&#40;android&#41;: add monochrome app icons for Android 13 &#40;by @h9419&#41;)

[//]: # (- feat&#40;android&#41;: set custom download path)

[//]: # (- feat&#40;linux&#41;: enable system tray &#40;by @TheGB0077&#41;)

[//]: # (- fix: in multi-recipient mode, retrying causes a "canceled by sender" on the recipient device)

[//]: # (- fix: clear selection after finished message transfer)

[//]: # (- fix&#40;ios&#41;: could not scan local network on iOS 14+ &#40;by @TheGB0077&#41;)

[//]: # (- fix&#40;android, ios&#41;: fallback asset picker strings to English translation &#40;by @TheGB0077&#41;)

[//]: # (- fix&#40;linux&#41;: header bar glitches)

[//]: # ()
[//]: # (## 1.8.0 &#40;2023-03-05&#41;)

[//]: # ()
[//]: # (- feat: add send modes &#40;single recipient, multiple recipients&#41;)

[//]: # (- feat: selection gets cleared after finish by default &#40;part of send modes feature&#41;)

[//]: # (- feat: share to multiple recipients in parallel)

[//]: # (- feat: add troubleshoot page)

[//]: # (- feat: add 2 buttons to receive history: open folder + delete history)

[//]: # (- feat: cleanup scan UI by hiding multiple network interfaces inside the scan button)

[//]: # (- feat: edit text message in selected files)

[//]: # (- feat: improve device discovery by answering with TCP instead of UDP)

[//]: # (- feat&#40;ex. iOS&#41;: pressing destination directory in progress page will open the directory)

[//]: # (- feat&#40;android&#41;: share apk and install apk)

[//]: # (- feat&#40;android&#41;: Android TV support)

[//]: # (- feat&#40;android&#41;: show loading indicator when picking &#40;large&#41; files)

[//]: # (- feat&#40;windows&#41;: left click on tray icon opens app)

[//]: # (- feat&#40;linux&#41;: add Control+Q shortcut to exit app)

[//]: # (- fix: handshake error in unencrypted mode)

[//]: # (- fix: also scan multicast when pressing on a subnet sync button)

[//]: # (- fix&#40;android&#41;: missing app icon on Android 7)

[//]: # (- fix&#40;android,ios&#41;: show error message when saving to gallery failed)

[//]: # (- i18n: add bn, nl, uk)

[//]: # ()
[//]: # (## 1.7.0 &#40;2023-02-11&#41;)

[//]: # ()
[//]: # (- feat: improve device discovery by enabling multicast)

[//]: # (- feat: received files history)

[//]: # (- feat: show recent IP addresses in manual IP input)

[//]: # (- feat: separate language settings page)

[//]: # (- feat: message input is horizontally scrollable when multiline is unselected)

[//]: # (- feat: open message normally in QuickSave mode &#40;instead of saving it into a file&#41;)

[//]: # (- feat: improve error handling and add possibility to show exact error message for debugging)

[//]: # (- feat: add unencrypted HTTP mode &#40;for debugging&#41;)

[//]: # (- feat&#40;android&#41;: keep file name when saving to photos)

[//]: # (- feat&#40;desktop&#41;: use bigger default window size if display is big enough)

[//]: # (- feat&#40;windows&#41;: use "Microsoft YaHei UI" font in Windows which works better with Chinese characters)

[//]: # (- fix: cache cleanup on iOS)

[//]: # (- i18n: add ar, es-ES, fr-FR, hu, in, it, iw, ja, ko, ne, pl, pt-BR, ru, sv, tr, zh-Hant-HK, zh-Hant-TW &#40;Thanks to all the contributors!&#41;)

[//]: # ()
[//]: # (## 1.6.2 &#40;2023-01-28&#41;)

[//]: # ()
[//]: # (- fix&#40;desktop&#41;: close current instance when another is already open)

[//]: # (- fix: cannot receive files when Chinese language is active)

[//]: # (- fix&#40;android, ios&#41;: share files with non-English names)

[//]: # ()
[//]: # (## 1.6.1 &#40;2023-01-27&#41;)

[//]: # ()
[//]: # (- fix&#40;windows&#41;: app crashes when minimized to tray)

[//]: # (- fix&#40;android, ios&#41;: share intent sometimes not working)

[//]: # (- fix&#40;android, ios&#41;: scan not triggered when coming from share intent)

[//]: # (- fix&#40;android, ios&#41;: share intent produced duplicates after finishing a transfer)

[//]: # ()
[//]: # (## 1.6.0 &#40;2023-01-27&#41;)

[//]: # ()
[//]: # (- feat: show thumbnail in progress page)

[//]: # (- feat: improve cache clearing mechanism)

[//]: # (- feat: hashtag input now tries all combinations when multiple subnets are given)

[//]: # (- feat&#40;desktop&#41;: show dialog instead of bottom sheet when adding files)

[//]: # (- feat&#40;windows, mac&#41;: minimize to tray)

[//]: # (- feat&#40;windows&#41;: launch on login)

[//]: # (- feat: add multiline toggle to message input)

[//]: # (- fix: show correct file count in progress page)

[//]: # (- fix: add self-discovering prevention)

[//]: # (- i18n: add Simplified Chinese)

[//]: # ()
[//]: # (## 1.5.2 &#40;2023-01-14&#41;)

[//]: # ()
[//]: # (- F-Droid Release)

[//]: # ()
[//]: # (## 1.5.1 &#40;2023-01-10&#41;)

[//]: # ()
[//]: # (- fix&#40;windows&#41;: app sometimes crash on start)

[//]: # ()
[//]: # (## 1.5.0 &#40;2023-01-09&#41;)

[//]: # ()
[//]: # (- feat: quick save mode)

[//]: # (- feat: accept requests partially)

[//]: # (- feat: set destination directory during accept phase)

[//]: # (- feat: rename incoming files)

[//]: # (- feat: keep screen on during file transfer)

[//]: # (- feat: tap to open selected file before sending)

[//]: # ()
[//]: # (## 1.4.0 &#40;2023-01-06&#41;)

[//]: # ()
[//]: # (- feat: support multiple local IP addresses)

[//]: # (- feat: detect if message is a link and add a button to open the link)

[//]: # ()
[//]: # (## 1.3.1 &#40;2023-01-03&#41;)

[//]: # ()
[//]: # (- fix: local IP sometimes not found)

[//]: # ()
[//]: # (## 1.3.0 &#40;2023-01-03&#41;)

[//]: # ()
[//]: # (- feat: enter custom target address)

[//]: # (- feat: tap to open received file)

[//]: # (- feat: responsive UI)

[//]: # (- feat&#40;ios&#41;: receive share intent)

[//]: # (- feat&#40;windows&#41;: set destination folder)

[//]: # (- fix: update nearby device attributes when scan again)

[//]: # ()
[//]: # (## 1.2.0 &#40;2022-12-31&#41;)

[//]: # ()
[//]: # (- feat: drag and drop files)

[//]: # (- feat: share plain messages)

[//]: # (- feat&#40;android&#41;: receive share intent)

[//]: # ()
[//]: # (## 1.1.0 &#40;2022-12-30&#41;)

[//]: # ()
[//]: # (- feat&#40;android&#41;: add media picker)

[//]: # (- feat&#40;ios&#41;: merge image and video to common media picker)

[//]: # (- fix&#40;android&#41;: missing internet permission)

## 1.0.0 (2023-05-01)

- Initial Release
