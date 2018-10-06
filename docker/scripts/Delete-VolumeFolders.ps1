
@(
    "sitecore\workspace",
    "sitecore\.logs\sitecore",
    "sitecore\.logs\xconnect"
) | ForEach-Object{
    $path = "$PSScriptRoot\..\$_"
    Remove-Item -Recurse -Force -Exclude *.md -Path $path
}