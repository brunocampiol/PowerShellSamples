<#  
    Script will change the name of the files and add the current file count
#>

"!!! This file will change the name of the files on the script folder !!!"

"Please enter the desired file prefix you want"
$filePrefix = Read-Host

# Current directory
$currentDirectory = $(get-location).Path + "\TestFolder"
#$fileCount = ( Get-ChildItem $currentDirectory | Measure-Object ).Count
$counter = 0

Get-ChildItem -Path $currentDirectory |
Foreach-Object {
    #$_.FullName
    #$_.Name
    
    #$fileName = $filePrefix + $counter.ToString().PadLeft(5,'0') + ".txt"

    $fileExtention = [System.IO.Path]::GetExtension($_.FullName)
    $fileName =  $filePrefix + $counter.ToString().PadLeft(5,'0') + $fileExtention

    $fileNewName = $currentDirectory + "\" + $fileName

    #echo $fileNewName

    Rename-Item -Path $_.FullName -NewName $fileNewName
    $counter++
}

"Done"