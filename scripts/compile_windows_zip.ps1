# UNCOMMENT THESE LINES TO BUILD FROM LATEST COMMIT
# git reset --hard origin/main
# git pull

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build -d
fvm flutter build windows

Compress-Archive -Path build\windows\runner\Release\* -CompressionLevel Fastest -DestinationPath WorqSend-vXXX-windows.zip

Write-Output 'Generated Windows zip!'