$keymapXml = @"
<gs:GlobalizationServices xmlns:gs="urn:longhornGlobalizationUnattend">
    <gs:UserList>
        <gs:User UserID="Current" CopySettingsToDefaultUserAcct="true" CopySettingsToSystemAcct="true"/>
    </gs:UserList>
    <gs:InputPreferences>
        <gs:InputLanguageID Action="add" ID="0407:00000407" Default="true"/>
        <gs:InputLanguageID Action="remove" ID="0409:00000409"/>
    </gs:InputPreferences>
</gs:GlobalizationServices>
"@

$tempFile = [System.IO.Path]::GetTempFileName() + ".xml"
Set-Content $tempFile $keymapXml -Encoding Ascii
$cmd = "control intl.cpl,, /f:""$tempFile"""
cmd /c $cmd
Remove-Item -Force $tempFile
