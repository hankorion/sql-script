echo "Start to process patch script"


$currPath=Get-Location

echo "Current working path:`n $currPath"

$consolidatedPath = join-path $currPath 'SW-DBA-Patch-Script-Consolidated'
$consolidatedFilePath = join-path $consolidatedPath 'patch-script-consolidated.sql'
$scriptsTreePath = join-path $consolidatedPath 'path-scripts-treeview.txt'

Get-ChildItem $consolidatedPath -Recurse -Force `
| Sort-Object -Property FullName -Descending `
| ForEach-Object {
    try {
        Remove-Item -Path $_.FullName -Force -ErrorAction Ignore;
    }
    catch { }
}

tree /f /a > $scriptsTreePath

Get-ChildItem -recurse -Exclude 'patch-script-consolidated.sql' -include "*.sql" | % { Get-Content $_ -ReadCount 0 | Add-Content $consolidatedFilePath }

echo "`n Completed! `n"
echo "The consolidated patch script placed at:`n $consolidatedFilePath `n"
echo "And the list of file infomation can be found at:`n $scriptsTreePath"