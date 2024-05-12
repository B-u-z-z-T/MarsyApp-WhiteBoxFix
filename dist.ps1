param (
    [String]$Configuration,
    [String]$TargetDir,
    [String]$ProjectDir,
    [String]$TargetName,
    [String]$TargetFileName,
    [String]$Version
)

$isDebug = $Configuration -eq "Debug"
$gamePath = "D:\spt-381"

Write-Host "Build: $Configuration"
Write-Host "Target: $TargetDir"
Write-Host "TargetName: $TargetName"
Write-Host "TargetFileName: $TargetFileName"
Write-Host "ProjectDir: $ProjectDir"
Write-Host "Version: $Version"


Set-Location -Path $ProjectDir

Remove-Item -Path ".\dist" -Recurse -Force

New-Item -ItemType Directory -Path ".\dist\BepInEx\plugins" -Force

Copy-Item -Path "$TargetDir\$TargetFileName" -Destination "$gamePath\BepInEx\plugins\$TargetFileName" -Force
Copy-Item -Path "$TargetDir\$TargetFileName" -Destination ".\dist\BepInEx\plugins\$TargetFileName" -Force

Write-Host "Copied $TargetFileName to $gamePath\BepInEx\plugins\$TargetFileName"
Write-Host "Copied $TargetFileName to .\dist\BepInEx\plugins\$TargetFileName"

Compress-Archive -Path ".\dist\BepInEx" -Destination ".\dist\$TargetName-$Version.zip" -Force
Write-Host "Compressed .\dist\BepInEx to .\dist\$TargetName-$Version.zip"
