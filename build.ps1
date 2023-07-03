$pwd = (Get-Location).Path;
$folderName = Split-Path $pwd -Leaf;

# Generate images - You need to have imagemagick installed and available in your PATH
if (Get-Command magick -ErrorAction SilentlyContinue) {
    Set-Location -Path .\images
    & magick convert logo.png -resize 16x16 logo-16.png
    & magick convert logo.png -resize 24x24 logo-24.png
    & magick convert logo.png -resize 32x32 logo-32.png
    & magick convert logo.png -resize 48x48 logo-48.png
    & magick convert logo.png -resize 128x128 logo-128.png
    Set-Location -Path ..
}


# Check if $folderName.zip exists, if so, ask the user if they want to overwrite it
if (Test-Path "$folderName.zip") {
    $overwrite = Read-Host "The file $folderName.zip already exists. Do you want to overwrite it? (y/n)";
    if ($overwrite -eq 'n') {
        exit;
    } else {
        Remove-Item "$folderName.zip";
    }
}

$files = 'images', 'background.js', 'manifest.json', 'popup.html', 'README.md', 'rules.json';
Compress-Archive -Path $files -DestinationPath "$folderName.zip";

# Now, in LICENSE, let's replace [year] with the current year
$year = (Get-Date).Year;
(Get-Content LICENSE) -replace '\[year\]', $year | Set-Content LICENSE;
