## 1.9.1 (2023-05-12)

- feat: add folder should include the folder itself
- fix: handle file names with special characters in link share mode
- fix(android): fix status bar icon color after picking a media file
- feat: directory share
- feat: share via browser link (for non-WorqSend users)
- feat: add "delete from history" button when file could not be opened
- feat: close message request when copied / opened link
- feat: slightly improve transfer speed
- feat: implement WorqSend protocol v2 with v1 fallback
- feat: scan (sync) button automatically scans all network interfaces when count < 3
- feat(android, ios): add "Save to gallery" setting button in file receive options
- feat(desktop): move troubleshoot out of navigation into send page
- feat(desktop): save last window position
- feat(android): enable edge-to-edge mode
- feat(android): add monochrome app icons for Android 13
- feat(android): set custom download path
- feat(linux): enable system tray
- fix: in multi-recipient mode, retrying causes a "canceled by sender" on the recipient device
- fix: clear selection after finished message transfer
- fix(ios): could not scan local network on iOS 14+ 
- fix(android, ios): fallback asset picker strings to English translation
- fix(linux): header bar glitches

## 1.3.0 (2023-05-08)

- feat: improve device discovery by enabling multicast

- feat: received files history

- feat: show recent IP addresses in manual IP input

- feat: separate language settings page

- feat: message input is horizontally scrollable when multiline is unselected

- feat: open message normally in QuickSave mode (instead of saving it into a file)

- feat: improve error handling and add possibility to show exact error message for debugging
- feat: add unencrypted HTTP mode (for debugging)
- feat(android): keep file name when saving to photos
- feat(desktop): use bigger default window size if display is big enough
- fix: cache cleanup on iOS
- feat: add send modes (single recipient, multiple recipients)
- feat: selection gets cleared after finish by default (part of send modes feature)
- feat: share to multiple recipients in parallel
- feat: add troubleshoot page
- feat: add 2 buttons to receive history: open folder + delete history
- feat: cleanup scan UI by hiding multiple network interfaces inside the scan button
- feat: edit text message in selected files
- feat: improve device discovery by answering with TCP instead of UDP
- feat(ex. iOS): pressing destination directory in progress page will open the directory
- feat(android): share apk and install apk
- feat(android): Android TV support
- feat(android): show loading indicator when picking (large) files
- feat(windows): left click on tray icon opens app
- feat(linux): add Control+Q shortcut to exit app
- fix: handshake error in unencrypted mode
- fix: also scan multicast when pressing on a subnet sync button
- fix(android): missing app icon on Android 7
- fix(android,ios): show error message when saving to gallery failed

## 1.2.0 (2023-05-07)

- fix(windows): app sometimes crash on start

- feat: support multiple local IP addresses

- feat: detect if message is a link and add a button to open the link

- feat: quick save mode

- feat: accept requests partially

- feat: set destination directory during accept phase

- feat: rename incoming files

- feat: keep screen on during file transfer

- feat: tap to open selected file before sending

- feat: show thumbnail in progress page

- feat: improve cache clearing mechanism

- feat: hashtag input now tries all combinations when multiple subnets are given

- feat(desktop): show dialog instead of bottom sheet when adding files

- feat(windows, mac): minimize to tray

- feat(windows): launch on login

- feat: add multiline toggle to message input

- fix: show correct file count in progress page

- fix: add self-discovering prevention

## 1.1.0 (2022-05-05)

- fix: local IP sometimes not found

- feat: enter custom target address

- feat: tap to open received file

- feat: responsive UI

- feat(ios): receive share intent

- feat(windows): set destination folder

- fix: update nearby device attributes when scan again

- feat: drag and drop files

- feat: share plain messages

- feat(android): receive share intent
- 
- feat(android): add media picker

- feat(ios): merge image and video to common media picker

- fix(android): missing internet permission

## 1.0.0 (2023-05-01)

- Initial Release
