# ==== validate.ps1 ====

# This script runs as part of the doc build process for each PR that touches 
# a file in the Power Fx directory. It must pass or the PR cannot be merged. 
# This script does not modify any files, it is purely read only.

# It checks for:
# - Consistency between the reference/include/* files and the .json and 
#   .json.errata files in this directory.
# - Consistency between the formula-reference-* files and the reference/* 
#   files augmented with .md.errata files.
# - Consistency between the TOC.yml and formula-reference-* files.

# You can run this script yourself too. Run it from anywhere in your repo 
# clone. A good idea before starting your PR.

Set-StrictMode -Version 2.0

. "$(Split-Path $MyInvocation.MyCommand.Path)\hostmap.ps1"

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
        $Global:errorData[$Global:lastErrorFile].Errors += "`nCategory: $category"
    }

    if ($details -ne $null) {
        $Global:errorData[$Global:lastErrorFile].Errors += "`n    $details"
    }
}

foreach ( $jsonFile in Get-ChildItem "$powerFxPath/funcjson" -Filter *.json ) {
    $errataMinus = @()
    $errataPlus = @()
    $errataFile = $jsonFile.FullName + ".errata"
    if ( Test-Path $errataFile )
    {
        $errataContent = [System.IO.File]::ReadAllText( $errataFile, $enc )
        ForEach ($errata in $($errataContent -split "`n"))
        {
            if ($errata -match '^\-\s(\w+)') {
                $errataMinus += $matches[1]           
            }
            if ($errata -match '^\+\s*(\w+)') {
                $errataPlus += $matches[1]                
            }            
        }
    }

    $errorFile = $jsonFile.Name

    $jsonFile.Name -match '^(.+)\.json' | out-null
    $appliesToName = $matches[1]
    if ( $skipJson -contains $appliesToName ) {
        continue
    }

    $jsonContent = [System.IO.File]::ReadAllText( $jsonFile.FullName, $enc )
    $json = ConvertFrom-Json $jsonContent -AsHashtable
    if ($json) {
        $jsonFunctionNames = $json.FunctionNames  
    }
    else {
        $jsonFunctionNames = @()
    }  

    foreach ($errata in $errataPlus) {
        if ($jsonFunctionNames -notcontains $errata) {
            $jsonFunctionNames += $errata;
        }
    }

    $jsonFuncs[$appliesToName] = @()
    foreach ( $functionName in $jsonFunctionNames ) {
        if ($errataMinus -contains $functionName) {
            continue;
        }
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

    if ($json) {
        if ($json.ContainsKey( "HostObjects" )) {
            foreach ( $hostObject in $json.HostObjects ) {
                $jsonFuncs[$appliesToName] += $hostObject
            }
        }
    }
}

$refLinks = @{}
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
                if ( $refLine -match '^\*\*\[(\w+)\]\(\s*([^\)\s]+)\s*\)' ) {
                    $refFunc = $matches[1]
                    $refLink = $matches[2]
                    if ( $jsonFuncs[$appliesToName] -contains $refFunc ) {
                        $jsonFuncsSeen += $refFunc
                    }
                    elseif (@('As', 'exactin', 'in', 'ThisItem', 'ThisRecord', 'Parent', 'Self', 'Color') -contains $refFunc ) {
                        # nop, operators do not need to be in the function list
                    }
                    else {
                        error "Functions not found in JSON file funcjson/$appliesToName.json" $refFunc
                    }

                    if ($refLinks[$refFunc]) {
                        if (-not ($refLinks[$refFunc] -eq $refLink)) {
                            $v =  $refLInks[$refFunc]
                            error "Inconsistent reference link for $refFunc"
                        }
                    }
                    else {
                        $refLinks[$refFunc] = $refLink
                    }
                }
            }

            $banner = $false
            foreach ( $jsonFunc in $jsonFuncs[$appliesToName] ) {
                if ( -not ($jsonFuncsSeen -contains $jsonFunc) ) {
                    error "Functions not found in Reference markdown file" $jsonFunc
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
            elseif (-not ($refFuncName -match '(?i)^(enumerations?|functions?|objects?|signals?|experimental|preview|action|related|and)$')) {
                $funcNames += $refFuncName
            }
        }
    }
    else {
        error "title not found or understood"
        continue
    }

    # Get the include file content which has applies-to text for the current reference file
    $refIncludesPattern = '[\n\r]\[!INCLUDE\[.+\]\(includes/(.+-applies-to\.md)\)\]'
    if ($refContent -match $refIncludesPattern) {
        $includeFileName = $matches[1]
        $file = "$powerFxPath/reference/includes/$includeFileName"

        $includeContent = [System.IO.File]::ReadAllText( $file, $enc )   
        $funcIncludeLine = @{}; 
        ForEach ($includeLine in $($includeContent -split "`n"))
        {
            if ($includeLine -match '^\s*\|\s*([\w\*<>/]+)\s*\|')
            {
                $funcInlineNames = $matches[1]
                $funcInlineNames = $funcInlineNames -replace '\*', ''
                $funcInlineNames = $funcInlineNames -split '</br>'
                foreach($f in $funcInlineNames)
                {
                    $funcIncludeLine[$f] = $includeLine
                }
            }
            elseif ($includeLine -imatch '^\s*\*\*applies to:')
            {
                foreach( $f in $funcNames)
                {
                    $funcIncludeLine[$f] = $includeLine
                }
            }
        }

        foreach ($f in $funcNames)
        {
            if (-not $funcIncludeLine[$f])
            {
                error "include line missing for $f"
            }
            else
            {
                $refAppliesTo = Select-String ':::image[^:]*source="[^:]*media/yes-icon.svg"[^:]*:::([^|:\<\n\r]+)' -input $funcIncludeLine[$f] -AllMatches
                if ($refAppliesTo -and $refAppliesTo.matches.Count -gt 0) {
                    foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                        $appliesToHost = $appliesToMatch.Groups[1].Value.trim().ToLower().Trim('</br>')
                        $appTo = $lowerProductToHost[$appliesToHost]

                        if (-not $appTo) {
                            error "Host $appTo not found in product list for $f"
                        }
                        else
                        {
                            if (-not $jsonFuncs[$appTo] -contains $f) {
                                error "JSON entry for AppliesTo not found" "$appliesTo, $f"
                            }
                            
                            $jsonFuncs[$appTo] = $jsonFuncs[$appTo] -replace $f, ""
                        }
                    }
                }
                else
                {
                    error "can't parse include line for $f" $funcIncludeLine[$f]
                }   
            }

            foreach ($j in $jsonFuncs.Keys)
            {
                if ($jsonFuncs[$j] -contains $f)
                {
                    error "AppliesTo entry not found for JSON entry" "$j, $f"
                }
            }
        }
    }
    else {
        error "AppliesTo includes entry not found for reference file: $refName"
    }
}

foreach ($func in $jsonFuncsSeen) {
    if (-not $refLinks[$func]) {
        error "no reference link for $func"
    }
}

$errorFile = "TOC.yml"
$tocContent = Get-Content "$powerFxPath/TOC.yml"
$tocLines = $tocContent -split '[\n\r]+'
$refPrefix = ""
$name = ""
$tocFuncsSeen = @()
foreach ($toc in $tocLines ) {
    $toc = $toc -replace "`t", "  "
    if ($refPrefix) {
        if ($toc -match "^$refPrefix - name: (.*)$") {
            $n = $matches[1]
            if ($name) {
                if (($n -lt $name) -and (-not ($name -imatch 'formula reference')) -and $name -ne 'Overview') {
                    error "TOC contents are out of order '$n' > '$name'"
                }
            }
            $name = $n
            if (-not ($name -imatch 'formula reference') -and $name -ne 'Overview') {
                $tocFuncsSeen += $name
            }
        }
        elseif ($toc -match "^$refPrefix   href: (\S+)") {
            $href = $matches[1]
            if ($href -match "^formula-reference-([\w-]+).md$") {
                $n = $hostToProduct[$matches[1]] + " formula reference"
                if ($name -ne 'Overview') {                
                    if ($name -ne $n) {
                        error "link to formula reference incorrect" $href
                    }
                }
            }
            else {
                if ($name -ne 'Overview') {
                    if (-not ($href -eq $refLinks[$name])) {
                        error "link to function reference article incorrect" $href
                    }
                }
            }
        }
        elseif ($toc -match "^$refPrefix items:") {
            # nothing to do
        }
        else {
            break
        }
    }
    elseif ($toc -match "^(.*) - Name: Formula reference") {
        $refPrefix = $matches[1] + "  "
    }
}

foreach ($func in $jsonFuncsSeen) {
    if (-not ($tocFuncsSeen -contains $func)) {
        error "no TOC function entry" $func
    }
}

foreach ($func in $tocFuncsSeen) {
    if (-not $refLinks[$func]) {
        error "no JSON function entry" $func
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