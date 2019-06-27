param ([String]$Path=".", [long]$MinimumSize = 0)
function Get-Docs ([string]$Path=".") {
  Get-ChildItem -Path $Path `
    -include *.txt,*.doc,*.docx,*.pdf,*.xls,*.ppt,*.ps1 `
    -Recurse `
    -ErrorAction SilentlyContinue
}
Get-Docs -Path $Path |
  Where-Object { $_.length -ge $minimumsize } |
  Select-Object FullName, LastAccessTime, Length |
  Sort-Object -Descending Lenth |
  Out-Gridview
