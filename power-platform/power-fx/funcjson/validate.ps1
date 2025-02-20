Set-StrictMode -Version 2.0

$powerFxPath = "./power-platform/power-fx"

$appliesToHosts = @{ 
    "canvas apps"               = "canvas-apps"
    "power platform cli"        = "pac-cli"
    "model-driven apps"         = "model-driven-apps"
    "power pages"               = "power-pages"
    "desktop flows"             = "desktop-flows"
    "dataverse formula columns" = "formula-columns"
}

$skipJson = @(
    "dv-lowcode-plugin"
    "fno"
    "pva"
)

$enc = [system.Text.Encoding]::UTF8

$jsonFuncs = @{}
$funcsJson = @{}

$Global:lastErrorFile = ""
$Global:lastErrorCategory = ""
$Global:lastErrorText = ""
$Global:errorCount = 0

$Global:errorData = @{}

function error {
    param ($category, $details)

    $Global:errorCount++

    if ($Global:lastErrorFile -ne $errorFile) {
        $Global:lastErrorFile = $errorFile
        $Global:lastErrorCategory = ""
        
        $Global:errorData[$Global:lastErrorFile] = [PSCustomObject]@{
            Errors     = ""
            ErrorCount = 1
        }        
    }
    else {
        $Global:errorData[$Global:lastErrorFile].ErrorCount++
    }

    if ($Global:lastErrorCategory -ne $category) {
        $Global:lastErrorCategory = $category
        $Global:errorData[$Global:lastErrorFile].Errors += "`n Category: $category"
    }

    if ($details -ne $null) {
        $Global:errorData[$Global:lastErrorFile].Errors += "`n    $details"
    }
}

foreach ( $jsonFile in Get-ChildItem "$powerFxPath/funcjson" -Filter *.json ) {
    $errorFile = $jsonFile.Name

    $jsonFile.Name -match '^(.+)\.json' | out-null
    $appliesToName = $matches[1]
    if ( $skipJson -contains $appliesToName ) {
        continue
    }

    $jsonContent = [System.IO.File]::ReadAllText( $jsonFile.FullName, $enc )
    $json = ConvertFrom-Json $jsonContent -AsHashtable

    $jsonFuncs[$appliesToName] = @()
    foreach ( $functionName in $json.FunctionNames ) {
        if ( $functionName -match '(\w+)\.' ) {
            if ( -not ($jsonFuncs[$appliesToName] -contains $matches[1])) {
                $jsonFuncs[$appliesToName] += $matches[1]
                if (-not $funcsJson.ContainsKey($matches[1])) {
                    $funcsJson[$matches[1]] = @()
                }
                $funcsJson[$matches[1]] += $appliesToName
            }
        }
        else {
            $jsonFuncs[$appliesToName] += $functionName
            if (-not $funcsJson.ContainsKey($functionName)) {
                $funcsJson[$functionName] = @()
            }            
            $funcsJson[$functionName] += $appliesToName
        }
    }

    if ($json.ContainsKey( "HostObjects" ) ) {
        foreach ( $hostObject in $json.HostObjects ) {
            $jsonFuncs[$appliesToName] += $hostObject
        }
    }
}

foreach ( $refFile in Get-ChildItem $powerFxPath -Filter formula-reference-*.md ) {
    $errorFile = $refFile.Name
    $refName = $refFile.Name

    if ( $refName -ne "formula-reference-overview.md" ) {
        $refContent = Get-Content "$powerFxPath/$refName"
        $refName -match 'formula-reference-(.+)\.md' | out-null
        $appliesToName = $matches[1]

        if ($jsonFuncs.ContainsKey($appliesToName)) {
            $jsonFuncsSeen = @()

            $refLines = $refContent -split '[\n\r]+'
            $banner = $false
            foreach ( $refLine in $refLines ) {
                if ( $refLine -match '^\*\*\[(\w+)' ) {
                    $refFunc = $matches[1]
                    if ( $jsonFuncs[$appliesToName] -contains $refFunc ) {
                        $jsonFuncsSeen += $refFunc
                    }
                    elseif (@('As', 'exactin', 'in', 'ThisItem', 'ThisRecord', 'Parent', 'Self', 'Color') -contains $refFunc ) {
                        # nop, operators do not need to be in the function list
                    }
                    else {
                        error "Functions not found in JSON file funcjson/$appliesToName.json" $refFunc
                    }
                }
            }

            $banner = $false
            foreach ( $jsonFunc in $jsonFuncs[$appliesToName] ) {
                if ( -not ($jsonFuncsSeen -contains $jsonFunc) ) {
                    error "Functions not found in Reference markdown file: $refName" $jsonFunc
                }
            }
        }
        else {
            error "JSON file funcjson/$appliesToName.json not found"
        }
    }
}

foreach ( $refFile in Get-ChildItem "$powerFxPath/reference" -Filter *.md ) {
    $errorFile = $refFile.Name

    $refName = $refFile.Name
    $funcNames = @()

    $refContent = [System.IO.File]::ReadAllText( $refFile.FullName, $enc )

    if ($refContent -match '(?m)[\r\n]title:([^\r\n]+)[\r\n]') {
        $refFuncNames = Select-String '(\w+)' -input $matches[1] -AllMatches
        foreach ( $refFuncMatchWhole in $refFuncNames.matches ) {
            $refFuncName = $refFuncMatchWhole.Groups[1].Value
            if ($refFuncName -eq "in") {
                break;
            }
            elseif (-not ($refFuncName -match '(?i)^(functions?|objects?|signals?|and)$')) {
                $funcNames += $refFuncName
            }
        }
    }
    else {
        error "title not found or understood"
        continue
    }

    # Get the include file content which has applies-to text for the current reference file
    $refIncludesPattern = '(?m)^\[!INCLUDE\[.*\]\(includes/(.*-applies-to\.md)\)\]'
    if ($refContent -match $refIncludesPattern) {
        $includeFileName = $matches[1]
        $includeContent = [System.IO.File]::ReadAllText( "$powerFxPath/reference/includes/$includeFileName", $enc )    

        $refAppliesTo = Select-String ':::image[^:]*source="../media/yes-icon.svg"[^:]*:::\s*([^|:\n\r]+)' -input $includeContent -AllMatches
        $appliesToList = @()
        if ($refAppliesTo -and $refAppliesTo.matches.Count -gt 0) {
            foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                $appliesToHost = $appliesToMatch.Groups[1].Value.trim().ToLower().Trim('</br>')
                $appTo = $appliesToHosts[ $appliesToHost ]
                if ($appliesToHosts.ContainsKey( $appliesToHost ) -and (-not ($appliesToList -contains $appTo))) {
                    $appliesToList += $appTo
                }
                else {
                    error "Host $appTo not found in script appliesToHosts list"
                }
            }

            foreach ( $appliesTo in $appliesToList ) {
                foreach ( $funcName in $funcNames ) {
                    if ( -not ($jsonFuncs[$appliesTo] -contains $funcName) ) {
                        error "JSON entry for AppliesTo not found" "$appliesTo, $funcName"
                    }
                }
            }

            foreach ( $funcName in $funcNames ) {
                foreach ( $hostName in $funcsJson[$funcName] ) {
                    if (-not ($appliesToList -contains $hostName)) {
                        error "AppliesTo entry not found for JSON entry" "$hostName, $funcName"
                    }
                }
            }
        }
    }
    else {
        error "AppliesTo includes entry not found for reference file: $refName"
    }
}

write "`n######## Total Errors found: $Global:errorCount ########`n"

$Global:errorDataList = @()
foreach ($item in $Global:errorData.GetEnumerator() ) {
    $Global:errorDataList += [PSCustomObject]@{
        Filename     = $item.Key
        ErrorDetails = $item.Value.Errors.Trim()
        ErrorCount   = $item.Value.ErrorCount
    }
}


##### Comment this section out if you are running this script locally #####
$commentMsg = "**Formula reference validation** status update of commit _<a href='$env:COMMIT_URL' target='_blank'>$env:COMMIT_SHA</a>_:`n`n"
$jobStatus = "success"
if ( $Global:errorCount -gt 0 ) {
    $commentMsg += "### :x: Validation status: failed`n`n"
    $commentMsg += "Total errors found: **$Global:errorCount**`n"
    $commentMsg += "Please refer to the _Validate PowerFx references / validate_ build check for more details: _<a href='$env:JOB_URL' target='_blank'>$env:JOB_ID</a>_"
    $jobStatus = "failure"
}
else {
    $commentMsg = "### :white_check_mark: Validation status: passed`n'n"
    $commentMsg += "Please refer to the _Validate PowerFx references / validate_ build check for more details: _<a href='$env:JOB_URL' target='_blank'>$env:JOB_ID</a>_"
}

echo "SCRIPT_OUTPUT<<EOF" >> $env:GITHUB_OUTPUT
echo $commentMsg >> $env:GITHUB_OUTPUT
echo "EOF" >> $env:GITHUB_OUTPUT

echo "JOB_STATUS=$jobStatus" >> $env:GITHUB_OUTPUT
############################################################################

$Global:errorDataList | Format-Table -Property Filename, ErrorDetails -Wrap -AutoSize

exit 0