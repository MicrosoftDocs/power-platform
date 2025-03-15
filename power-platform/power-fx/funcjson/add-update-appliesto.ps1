Set-StrictMode -Version 2.0

. "$(Split-Path $MyInvocation.MyCommand.Path)\hostmap.ps1"

$funcsAppliesToMap = @{}

function get_func_appliesto_map {
    foreach ( $jsonFile in Get-ChildItem "$powerFxPath/funcjson" -Filter *.json ) {
    
        $jsonFile.Name -match '^(.+)\.json' | out-null
        $appliesToName = $matches[1]
        # if ( $skipJson -contains $appliesToName ) {
        #     continue
        # }

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
            $funcsAppliesToMap[$funcName] += $appliesToName
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
        $refContent = [System.IO.File]::ReadAllText( $refFileFullName, $enc )

        $errataMinus = @()
        $errataPlus = @()
        $errataAllProducts = @()
        $errataFile = "$powerFxPath/funcjson/" + $refFile.Name + ".errata"
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
        if (!([System.IO.File]::Exists($includeFilePath))) {
            New-Item -path $includeRoot -type file -name $includeFileName | out-null
        }
        else {
            Remove-Item $includeFilePath
            New-Item -path $includeRoot -type file -name $includeFileName | out-null
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
            Write-Host "Function names not understood from title for file: $refName"
            continue
        }

        #If all funcs have same applies-to create an include file with applies-to text        
        if ($appliesToGroup.Count -eq 1) {
            $appliesToText = "`n**Applies to:** "
            foreach ($appTo in $appliesToGroup.Keys[0].Split(",")) {
                $appToText = $hostToProduct[$appTo]
                $appliesToText += $imageType + $appToText
            }
       
            Set-Content $includeFilePath $appliesToText
        }
        # If funcs differ in applies-to, create an include file with applies-to table
        elseif ($appliesToGroup.Count -gt 1) {
            $plural = 0
            foreach ($key in $appliesToGroup.Keys) {
                if ($appliesToGroup[$key].count -gt 1) {
                    $plural = 1
                }
            }
            $tableText = "`n| Function" + ($plural ? "s" : "") + " | Applies to |`n"
            $tableText += "|-----------|------------|`n"			
            foreach ($key in $appliesToGroup.Keys) {
                $appliesToText = ""
                $funcText = ""
                $itemCount = 0
                foreach ($appTo in $key.Split(",")) {
                    $appToText = $hostToProduct[$appTo]
                    if (-not $appToText) {
                        write-host "$key, $appTo map not found in $refName"
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

                $tableText = $tableText + "| $funcText | $appliesToText |`n"
            }
			
            Set-Content $includeFilePath $tableText
        }
        
        # Remove applies-to header if exists from the reference file
        $refAppliesHeader = Select-String '\*?\*?Applies to:\*?\*? :::image' -input $refContent -AllMatches
        if ($refAppliesHeader) {
            foreach ( $appToHeader in $refAppliesHeader.matches ) {
                $refContent = $refContent.Replace($appToHeader.Value, ":::image")
            }
        }

        # Remove existing applies-to text if exists from the reference file
        $refAppliesTo = Select-String ':::image[^:]*source="media/yes-icon.svg"[^:]*:::\s*([^|:\n\r]+)' -input $refContent -AllMatches        
        if ($refAppliesTo) {
            foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                $refContent = $refContent.Replace($appliesToMatch.Value, "")
            }
        }
    
        # Remove existing applies-to include if exists from the reference file
        $refAppliesTo = Select-String '\n*\[!INCLUDE\[[\w\-]+-applies-to\]\(includes[/\\][\w\-]+-applies-to.md\)\]' -input $refContent -AllMatches        
        if ($refAppliesTo) {
            foreach ( $appliesToMatch in $refAppliesTo.matches ) {
                $refContent = $refContent.Replace($appliesToMatch.Value, "")
            }
        }        

        # Add new applies-to include to the reference file after heading 1
        if ($refContent -match '[\n\r]+# .+') {
            $includeText = $includeFileName.Replace(".md", "")
            $refContent = $refContent -replace '[\n\r]+# .+', "`$&`n[!INCLUDE[$includeText](includes/$includeFileName)]"
        }
        Set-Content $refFileFullName $refContent
    }
}

function Main () {  
    get_func_appliesto_map
    apply_appliesto
}

Main 