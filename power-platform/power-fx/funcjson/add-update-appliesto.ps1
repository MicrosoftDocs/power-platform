# ==== add-update-appliesto.ps1 ====

# In your local clone of the doc repo, run this script after updating the 
# .json or .errata files in this directory. It doesn't verify, it makes things right.

# It will:
# - Apply updates to the "Applies to:" in each of the reference/include/* files.
# - Update the TOC.yml to use the same links that are in formula-reference-* files.

# see README.txt for more details

Set-StrictMode -Version 2.0

. "$(Split-Path $MyInvocation.MyCommand.Path)\hostmap.ps1"

$funcsAppliesToMap = @{}

# default line endings, can be overridden when we see file contents
$nl = "`r`n"

function get_formula_references {
    $refLink = @{}    
    $refProducts = @()
    foreach ( $refFile in Get-ChildItem $powerFxPath -Filter formula-reference-*.md ) {
        $refName = $refFile.Name

        if ( $refName -ne "formula-reference-overview.md" ) {
            if ($refName -match "formula-reference-(.*)\.md") {
                $refFile = $matches[1]
                $refProducts += $hostToProduct[$refFile]
            }
            else {
                write-host "can't parse formula reference file name"
            }

            $refContent = Get-Content "$powerFxPath/$refName"
            $refName -match 'formula-reference-(.+)\.md' | out-null
            $appliesToName = $matches[1]

            $refLines = $refContent -split '[\n\r]+'
            foreach ( $refLine in $refLines ) {
                if ( $refLine -match '^\*\*\[(\w+)\]\(\s*([^\)\s]+)\s*\)' ) {
                    if ($refLink -contains $matches[1]) {
                        write-host "duplicate for $matches[1]"
                        if (-not ($refLink[$matches[1]] -eq $matches[2])) {
                            write-host "reference links for $matches[1] do not agree: $refLink[$matches[1]] $matches[2]"
                        }
                    }
                    else {
                        $refLink[$matches[1]] = $matches[2]
                    }
                }
            }
        }
    }

    foreach ($func in $funcsAppliesToMap.Keys) {
        if (-not $refLink[$func]) {
            write-host "no reference link for $func"
        }
    }

    $tocContent = [System.IO.File]::ReadAllText( "$powerFxPath/TOC.yml", $enc )

    # look for first newline to determine which kind of newline to emit, different folks have different Git settings
    if ($tocContent -match '(\r\n|\n|\r)') {
        $nl = $matches[1];
    }

    $tocLines = $tocContent -split '\r\n|\n|\r'
    $refPrefix = ""
    $tocCompare = ""
    foreach ($toc in $tocLines ) {
        $tocCompare += $toc + $nl
        $toc = $toc -replace "`t", "  "
        if ($refPrefix) {
            if ($toc -match "^$refPrefix") {
                # eat lines until we are back at the same indentation level
            }
            else {
                $newToc += $toc + $nl
                $refPrefix = ""
            }
        }
        elseif ($toc -match '^(\s*) - name: Formula reference') {
            $refPrefix = $matches[1]
            $newToc += "$refPrefix - name: Formula reference" + $nl
            $newToc += "$refPrefix   items:" + $nl
            $refPrefix += "  "
            $newToc += "$refPrefix - name: Overview" + $nl
            $newToc += "$refPrefix   href: formula-reference-overview.md" + $nl
            $refProducts = ($refProducts | Sort-Object)
            foreach ($r in $refProducts) {
                $n = $r + " formula reference"
                $newToc += "$refPrefix - name: $n" + $nl
                $p = $productToHost[$r]
                $newToc += "$refPrefix   href: formula-reference-$p.md" + $nl
            }
            $refKeys = $refLink.Keys | Sort-Object
            foreach ($r in $refKeys) {
                $newToc += "$refPrefix - name: $r" + $nl
                $l = $refLink[$r]
                $newToc += "$refPrefix   href: $l" + $nl
            }
        }
        else {
            $newToc += $toc + $nl
        }
    }    

    if (-not ($tocCompare -eq $newToc)) {
        [System.IO.File]::WriteAllText( "$powerFxPath/TOC.yml", $newToc, $enc )
        Write-Host "Updated TOC.yml"
    }
}

function get_func_appliesto_map {
    foreach ( $jsonFile in Get-ChildItem "$powerFxPath/funcjson" -Filter *.json ) {
    
        $jsonFile.Name -match '^(.+)\.json' | out-null
        $appliesToName = $matches[1]

        $errataMinus = @()
        $errataPlus = @()
        $errataFile = $jsonFile.FullName + ".errata"
        if ( Test-Path $errataFile )
        {
            $errataContent = [System.IO.File]::ReadAllText( $errataFile, $enc )
            ForEach ($errata in $($errataContent -split "[\r\n]+"))
            {
                if ($errata -match '^\-\s(\w+)') {
                    $errataMinus += $matches[1]           
                }
                if ($errata -match '^\+\s*(\w+)') {
                    $errataPlus += $matches[1]                
                }            
            }
        }  

        $jsonFunctionNames = @()

        $jsonContent = [System.IO.File]::ReadAllText( $jsonFile.FullName, $enc )
        $json = ConvertFrom-Json $jsonContent -AsHashtable

        if ($json -and $json.ContainsKey( "FunctionNames" )) {
            foreach ($jsonFunc in $json.FunctionNames) {
                    $jsonFunctionNames += $jsonFunc;
            }   
        }

        foreach ($errata in $errataPlus) {
            if ($jsonFunctionNames -notcontains $errata) {
                $jsonFunctionNames += $errata;
            }
        }                        

        foreach ( $functionName in $jsonFunctionNames ) {  
            if ($errataMinus -contains $functionName) {
                continue;
            }            
            $funcName = ""
            if ( $functionName -match '(\w+)\.' ) {
                $funcName = $matches[1]
            }
            else {        
                $funcName = $functionName
            }          
            if (-not $funcsAppliesToMap.ContainsKey($funcName)) {
                $funcsAppliesToMap[$funcName] = @()
            }       
            if (-not ($funcsAppliesToMap[$funcName] -contains $appliesToName)) {
                $funcsAppliesToMap[$funcName] += $appliesToName
            }
        }
    
        if ($json -and $json.ContainsKey( "HostObjects" ) ) {
            foreach ( $hostObject in $json.HostObjects ) {
                if (-not $funcsAppliesToMap.ContainsKey($hostObject)) {
                    $funcsAppliesToMap[$hostObject] = @()
                }
                $funcsAppliesToMap[$hostObject] += $appliesToName
            }
        }
    }
}

function apply_appliesto() {
    $appliesToText = "**Applies to:** "
    $imageType = ":::image type=`"icon`" source=`"../media/yes-icon.svg`" border=`"false`"::: "
    foreach ( $refFile in Get-ChildItem "$powerFxPath/reference" -Filter *.md ) {
        $refFileFullName = $refFile.FullName
        $refName = $refFile.Name
        $originalRefContent = [System.IO.File]::ReadAllText( $refFileFullName, $enc )

        # look for first newline to determine which kind of newline to emit, different folks have different Git settings
        if ($originalRefContent -match '(\r\n|\n|\r)') {
            $nl = $matches[1];
        }

        $refContent = $originalRefContent

        $errataMinus = @()
        $errataPlus = @()
        $errataAllProducts = @()
        $errataFile = "$powerFxPath/funcjson/" + $refFile.Name + ".errata"
        if ( Test-Path $errataFile )
        {
            $errataContent = [System.IO.File]::ReadAllText( $errataFile, $enc )            
            ForEach ($errata in $($errataContent -split "[\r\n]+"))
            {
                if ($errata -match '^\-\s(\w+)') {
                    $errataMinus += $matches[1]           
                }
                if ($errata -match '^\+\s*(\w+)') {
                    $errataPlus += $matches[1]                
                }
                if ($errata -match '^>\s*AllProducts\s+(\w+)') {
                    $errataAllProducts += $matches[1]           
                }   
            }
        }  

        $includeRoot = "$powerFxPath\reference\includes\"
        $includeFileName = $refName.Replace('.md', '') + "-applies-to.md"

        if (!(test-path $includeRoot)) {
            md $includeRoot
        } 
	   
        $includeFilePath = $includeRoot + $includeFileName
	   
        # Refresh the include file
        if (Test-Path $includeFilePath) {
            $incContent = [System.IO.File]::ReadAllText( $includeFilePath, $enc )

            # look for first newline to determine which kind of newline to emit, different folks have different Git settings
            if ($incContent -match '(\r\n|\n|\r)') {
                $nl = $matches[1];            
            }
#            write-host $includeFilePath $nl.length
        }
        else {
            $incContent = ""
        }

        # create a group of same applies-to and add all applicable functions to it
        $appliesToGroup = @{}
        if ($refContent -match '(?m)[\r\n]title:([^\r\n]+)[\r\n]') {
            $titleMatch = ($errataPlus -join " ") + " " + $matches[1]
            $refFuncNames = Select-String '(\w+)' -input $titleMatch -AllMatches
            foreach ( $refFuncMatchWhole in $refFuncNames.matches ) {
                $refFuncName = $refFuncMatchWhole.Groups[1].Value
                if ($refFuncName -eq "in") {
                    break;
                }
                elseif (-not ($refFuncName -match '(?i)^(enumerations?|functions?|objects?|signals?|experimental|preview|action|related|and)$')) {
                    if (-not ($errataMinus -contains $refFuncName)) {              
                        if ($errataAllProducts -contains $refFuncName) {
                            $appliesTo = $allProductList | Sort-Object
                        } 
                        else {
                            $appliesTo = $funcsAppliesToMap[$refFuncName] | Sort-Object
                        }
                        $appToKey = $appliesTo -join ","   
                        if (-not $appliesToGroup.ContainsKey($appToKey)) { 
                            $appliesToGroup[$appToKey] = @()
                        }
                        $appliesToGroup[$appToKey] += $refFuncName 
                    }
                }
            }
        }
        else {
            Write-Host "ERROR: Function names not understood from title for file: $refName"
            continue
        }

        # empty file
        if ($appliesToGroup.Count -eq 0) {
            $newInc = ""
        }
        #If all funcs have same applies-to create an include file with applies-to text        
        elseif ($appliesToGroup.Count -eq 1) {
            $appliesToText = $nl + "**Applies to:** "
            foreach ($appTo in $appliesToGroup.Keys[0].Split(",")) {
                $appToText = $hostToProduct[$appTo]
                $appliesToText += $imageType + $appToText
            }
       
            $newInc = $appliesToText + $nl
        }
        # If funcs differ in applies-to, create an include file with applies-to table
        elseif ($appliesToGroup.Count -gt 1) {
            $plural = 0
            foreach ($key in $appliesToGroup.Keys) {
                if ($appliesToGroup[$key].count -gt 1) {
                    $plural = 1
                }
            }

            $tableLines = @()
            foreach ($key in $appliesToGroup.Keys) {
                $appliesToText = ""
                $funcText = ""
                $itemCount = 0
                foreach ($appTo in $key.Split(",")) {
                    $appToText = $hostToProduct[$appTo]
                    if (-not $appToText) {
                        write-host "ERROR: $key, $appTo map not found in $refName"
                    }
                    $itemCount += 1
                    if ($itemCount -eq 1) {
                        $appliesToText += $imageType + $appToText
                    }
                    else {
                        $appliesToText += ' ' + $imageType + $appToText
                    }
                    
                }
				
                $itemCount = 0
                foreach ($func in $appliesToGroup[$key]) {
                    $itemCount += 1
                    if ($itemCount -eq 1) {
                        $funcText += "**" + $func + "**"
                    }
                    else {
                        $funcText += '</br>' + "**" + $func + "**"
                    }
                }

                $tableLines += "| $funcText | $appliesToText |"
            }
            $tableLinesSorted = $tableLines | Sort-Object
                        
            $tableText = $nl + "| Function" + ($plural ? "s" : "") + " | Applies to |" + $nl
            $tableText += "|-----------|------------|" + $nl
            $tableText += ($tableLinesSorted -join $nl)
			
            $newInc = $tableText + $nl + $nl
        }

        if (-not ($incContent -eq $newInc))
        {   
            [System.IO.File]::WriteAllText( $includeFilePath, $newInc, $enc )
            write-host "updated $includeFilePath"
        }

        # Remove applies-to header if exists from the reference file
        $refAppliesHeader = Select-String '\*?\*?Applies to:\*?\*? :::image' -input $refContent -AllMatches
        if ($refAppliesHeader) {
            foreach ( $appToHeader in $refAppliesHeader.matches ) {
                $refContent = $refContent.Replace($appToHeader.Value, ":::image")
            }
        }

        # Remove existing applies-to text if exists from the reference file
        $refAppliesTo = Select-String ':::image[^:]*source="media/yes-icon.svg"[^:]*:::\s*([^|:\r\n]+)' -input $refContent -AllMatches        
        if ($refAppliesTo) {
            foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                $refContent = $refContent.Replace($appliesToMatch.Value, "")
            }
        }
    
        # Remove existing applies-to include if exists from the reference file
        $refAppliesTo = Select-String '(\r\n|\n|\r)\[!INCLUDE\[[\w\-]+-applies-to\]\(includes[/\\][\w\-]+-applies-to.md\)\]' -input $refContent -AllMatches        
        if ($refAppliesTo) {
            foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                $refContent = $refContent.Replace($appliesToMatch.Value, "")
            }
        }        

        # Add new applies-to include to the reference file after heading 1
        $includeText = $includeFileName.Replace(".md", "")
        $refContent = $refContent -replace '(\r\n|\n|\r)# [^\r\n]+', ("`$&`$1[!INCLUDE[$includeText](includes/$includeFileName)]")

        if (-not ($refContent -eq $originalRefContent))
        {
            [System.IO.File]::WriteAllText( $refFileFullName, $refContent, $enc )
            write-host "updated $refFileFullName"
        }
    }
}

function Main () {  
    get_func_appliesto_map
    apply_appliesto
    get_formula_references
    Write-Host "Update complete`n"
}

Main 
