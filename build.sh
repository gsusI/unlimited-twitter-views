# Find the name of the current directory
foldername=$(basename $(pwd))

# Generate images
cd images
convert logo.png -resize 16x16 logo-16.png
convert logo.png -resize 24x24 logo-24.png
convert logo.png -resize 32x32 logo-32.png
convert logo.png -resize 48x48 logo-48.png
convert logo.png -resize 128x128 logo-128.png
cd ..



# Check if foldername.zip exists, if so, ask the user if they want to overwrite it
if [ -f "$foldername.zip" ]; then
    read -p "The file $foldername.zip already exists. Do you want to overwrite it? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    else
        rm $foldername.zip
    fi
fi

# List of files and directories to include in the zip
files="images background.js manifest.json popup.html README.md rules.json"

# Create the zip file
zip -r $foldername.zip $files

# Now, in LICENSE, let's replace [year] with the current year
sed -i "s/\[year\]/$(date +%Y)/g" LICENSE
