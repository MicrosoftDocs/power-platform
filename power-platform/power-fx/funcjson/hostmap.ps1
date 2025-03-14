# common logic and name maps

$productToHost = @{ 
    "Canvas apps"               = "canvas-apps"
    "Cards"                     = "Cards"
    "Power Platform CLI"        = "pac-cli"
    "Model-driven apps"         = "model-driven-apps"
    "Power Pages"               = "power-pages"
    "Desktop flows"             = "desktop-flows"
    "Dataverse formula columns" = "formula-columns"
    "Copilot Studio"            = "copilot-studio"
    "Dataverse functions"       = "plug-ins"
}

$hostToProduct = @{}
$lowerProductToHost = @{}
foreach($p in $productToHost.Keys)
{
    $hostToProduct[$productToHost[$p]] = $p;
    $lowerProductToHost[$p.ToLower().Trim()] = $productToHost[$p]
}

$skipJson = @{}

# find root of repo directory

$pathParts = $($pwd -split "[\\\/]")
for( $i = $pathParts.Count; $i -gt 0; $i--) { 
    if( Test-Path (($pathParts[0..$i] -join "\") + "\.git") ) {
        break
    }
}
if( $i -eq 0)
{
    write "couldn't find root repo directory via .git"
    exit
}
$powerFxPath = ($pathParts[0..$i] -join "\") + "\power-platform\power-fx"

# validate that we have funciton json files for map entries

foreach ($p in $productToHost.Keys)
{
    $pp = $powerFxPath + "/funcjson/" + $productToHost[$p] + ".json"
    if (-not (Test-Path $pp))
    {
        write-host "Can't find function json file for $p ($pp)"
    }
}

# everything is UTF8

$enc = [system.Text.Encoding]::UTF8
