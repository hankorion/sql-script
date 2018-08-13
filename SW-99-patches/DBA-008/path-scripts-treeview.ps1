tree /f /a > path-scripts-treeview.txt

$currPath=Get-Location
$consolidatedPath = join-path $currPath 'SW-DBA-Patch-Script-Consolidated'
$consolidatedFilePath = join-path $consolidatedPath 'patch-script-consolidated.sql'
echo $consolidatedPath


Get-ChildItem $consolidatedPath -Recurse -Force `
| Sort-Object -Property FullName -Descending `
| ForEach-Object {
    try {
        Remove-Item -Path $_.FullName -Force -ErrorAction Ignore;
    }
    catch { }
}

Get-ChildItem -recurse -Exclude 'patch-script-consolidated.sql' -include "*.sql" | % { Get-Content $_ -ReadCount 0 | Add-Content $consolidatedFilePath }
