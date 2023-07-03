$pwd = (Get-Location).Path;
$folderName = Split-Path $pwd -Leaf;
$files = 'images', 'background.js', 'manifest.json', 'popup.html', 'README.md', 'rules.json';
Compress-Archive -Path $files -DestinationPath "$folderName.zip";
