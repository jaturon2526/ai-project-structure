# คัดลอก template ไปใช้ในโปรเจ็คอื่น (Windows PowerShell) — ไม่ทับไฟล์เดิม เว้นแต่ -Force
#   .\install.ps1 -Tool claude -Target C:\path\to\project
#   .\install.ps1 -Tool all -Target C:\path\to\project -Force
param(
  [Parameter(Mandatory)][ValidateSet('claude','antigravity','all')][string]$Tool,
  [Parameter(Mandatory)][string]$Target,
  [switch]$Force
)
$here = $PSScriptRoot
if (-not (Test-Path $Target)) { throw "target not found: $Target" }

function Copy-Tree([string]$Src) {
  $copied = 0; $skipped = 0
  Get-ChildItem $Src -Recurse -File -Force | ForEach-Object {
    $rel = $_.FullName.Substring($Src.Length + 1)
    if ($rel -like 'blank\*') { return }
    $dest = Join-Path $Target $rel
    New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
    if ((Test-Path $dest) -and -not $Force) { Write-Host "skip   $rel (exists)"; $script:skipped++ }
    else { Copy-Item $_.FullName $dest -Force; Write-Host "copy   $rel"; $script:copied++ }
  }
}
if ($Tool -in 'claude','all')      { Copy-Tree (Join-Path $here 'claude') }
if ($Tool -in 'antigravity','all') { Copy-Tree (Join-Path $here 'antigravity') }
Write-Host "Next: replace every {{PLACEHOLDER}}  ->  Select-String -Path $Target -Pattern '\{\{' -Recurse"
