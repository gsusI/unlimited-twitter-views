# Find the name of the current directory
foldername=$(basename $(pwd))

# List of files and directories to include in the zip
files="images background.js manifest.json popup.html README.md rules.json"

# Create the zip file
zip -r $foldername.zip $files
