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

function GetAppliesToText($key) {
    switch ($key) {
        'canvas-apps' { return 'Canvas apps' }
        'formula-columns' { return 'Dataverse formula columns' }
        'desktop-flows' { return 'Desktop flows' }
        'model-driven-apps' { return 'Model-driven apps' }
        'pac-cli' { return 'Power Platform CLI' }        
        'power-pages' { return 'Power Pages' }
        # 'cards' { return 'Cards' }
        # 'dv-lowcode-plugin' { return 'Dataverse low-code plug-ins' }
        # 'pva' { return 'Microsoft CoPilot studio' }
        # 'test-engine' { return 'Test Engine' }
        Default {
            Write-Host "Unknown Applies-to: $key"
            return "NotFound"
        }
    }
}

$enc = [system.Text.Encoding]::UTF8

$funcsAppliesToMap = @{}

function get_func_appliesto_map {
    foreach ( $jsonFile in Get-ChildItem "$powerFxPath/funcjson" -Filter *.json ) {
    
        $jsonFile.Name -match '^(.+)\.json' | out-null
        $appliesToName = $matches[1]
        # if ( $skipJson -contains $appliesToName ) {
        #     continue
        # }
    
        $jsonContent = [System.IO.File]::ReadAllText( $jsonFile.FullName, $enc )
        $json = ConvertFrom-Json $jsonContent -AsHashtable

        foreach ( $functionName in $json.FunctionNames ) {  
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
    
        if ($json.ContainsKey( "HostObjects" ) ) {
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
    
        $refName = $refFile.Name
    
        $refContent = [System.IO.File]::ReadAllText( $refFile.FullName, $enc )

        $includeRoot = $powerFxPath + "\reference\includes\"
        $includeFileName = $refName.Replace('.md', '') + "-applies-to.md"

        if (!(test-path $includeRoot)) {
            md $includeRoot
        } 
	   
        $includeFilePath = $includeRoot + $includeFileName
	   
        # Refresh the include file
        if (!([System.IO.File]::Exists($includeFilePath))) {
            New-Item -path $includeRoot -type file -name $includeFileName
        }
        else {
            Remove-Item $includeFilePath
            New-Item -path $includeRoot -type file -name $includeFileName
        }

        # create a group of same applies-to and add all applicable functions to it
        $appliesToGroup = @{}
        if ($refContent -match '(?m)[\r\n]title:([^\r\n]+)[\r\n]') {
            $refFuncNames = Select-String '(\w+)' -input $matches[1] -AllMatches
            foreach ( $refFuncMatchWhole in $refFuncNames.matches ) {
                $refFuncName = $refFuncMatchWhole.Groups[1].Value
                if ($refFuncName -eq "in") {
                    break;
                }
                elseif (-not ($refFuncName -match '(?i)^(functions?|objects?|signals?|and)$')) {
                    $appliesTo = $funcsAppliesToMap[$refFuncName] | Sort-Object
                    $appToKey = $appliesTo -join ","   
                    if (-not $appliesToGroup.ContainsKey($appToKey)) { 
                        $appliesToGroup[$appToKey] = @()
                    }                
                    $appliesToGroup[$appToKey] += $refFuncName 
                }
            }
        }
        else {
            Write-Host "Function names not understood from title for file: $refName"
            continue
        }

        #If all funcs have same applies-to create an include file with applies-to text
        if ($appliesToGroup.Count -eq 1) {
            $appliesToText = "**Applies to:** "
            foreach ($appTo in $appliesToGroup.Keys[0].Split(",")) {
                #Write-Host "$key :"
                $appToText = GetAppliesToText($appTo)
                if($appToText -eq "NotFound") {
                    continue
                }

                $appliesToText += $imageType + $appToText
            }
       
            Set-Content $includeFilePath $appliesToText
        }
        # If funcs differ in applies-to, create an include file with applies-to table
        elseif ($appliesToGroup.Count -gt 1) {
            $tableText = "**Applies to:** `n"
            $tableText += "| Functions | Applies to |`n"
            $tableText += "|-----------|------------|`n"			
            foreach ($key in $appliesToGroup.Keys) {
                $appliesToText = ""
                $funcText = ""
                $itemCount = 0
                foreach ($appTo in $key.Split(",")) {
                    $appToText = GetAppliesToText($appTo)
                    if($appToText -eq "NotFound") {
                        continue
                    }
                    $itemCount += 1
                    if ($itemCount -eq 1) {
                        $appliesToText += $imageType + $appToText
                    }
                    else {
                        $appliesToText += '</br>' + $imageType + $appToText
                    }
                    
                }
				
                $itemCount = 0
                foreach ($func in $appliesToGroup[$key]) {
                    $itemCount += 1
                    if ($itemCount -eq 1) {
                        $funcText += $func
                    }
                    else {
                        $funcText += '</br>' + $func
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
        foreach ( $appliesToMatch in $refAppliesTo.matches ) {
            $refContent = $refContent.Replace($appliesToMatch.Value, "")
        }
    
        # Add new applies-to include to the reference file after heading 1
        if ($refContent -match '(?m)^# .+') {
            $includeText = $includeFileName.Replace(".md", "")
            $refContent = $refContent -replace '(?m)^# .+', "`$&`n`n[!INCLUDE[$includeText](includes/$includeFileName)]"
        }
        Set-Content $refFile.FullName $refContent
    }
}

function Main () {  
    get_func_appliesto_map
    apply_appliesto
}

Main 