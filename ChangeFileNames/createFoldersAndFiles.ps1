<#  
    Purpose of this file is to create folders and files necessary to do the test
#>

# Gets current directory
$targetDirectory = $(get-location).Path + "\TestFolder"

# Creates a test folder
if(!(Test-Path -Path $targetDirectory )){
    New-Item -ItemType directory -Path $targetDirectory
}

# Delete files before executing
Get-ChildItem -Path $targetDirectory -Include *.* -File -Recurse | foreach { $_.Delete()}

# Add some files on it
$numberFiles = 5
For ($i=0; $i -le $numberFiles; $i++) 
{
    $timestamp = Get-Date;
    $fileName = "\" + $timestamp.ToString("HH-mm-ss-fffffff") + ".txt"
    $filePath = $targetDirectory + $fileName
    New-Item -ItemType "file" -Path $filePath
}