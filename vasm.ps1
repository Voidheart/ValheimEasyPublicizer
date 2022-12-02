$path = [System.IO.Path]

#Read Registry and get the Steam Path for Valheim
$SteamPath = Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Valve\Steam\' -Name 'SteamPath' -ErrorAction 'SilentlyContinue';
$SteamPath = $path::GetFullPath($path::Combine($SteamPath, 'steamapps\common\valheim'));
$ManagedPath = $path::Combine($SteamPath, "Valheim_Data\Managed");

#Valheim Paths
if (Test-Path -Path $ManagedPath) {
    #Clean up publicized directory if it exists before creating new assemblies
    $publicAsmDir = $path::Combine($ManagedPath, "publicized_assemblies");
    if ((Test-Path -Path $publicAsmDir) -and ((Get-ChildItem $publicAsmDir -Force | Select-Object -First 1 | Measure-Object).Count -ne 0)) {
        Write-Output "Publicized already exists. Initializing cleanup"
        foreach ($file in Get-ChildItem -Path $publicAsmDir -Filter "Assembly_*.dll") {
            Remove-Item $file.FullName
        }
    }

    foreach ($file in Get-ChildItem -Path $ManagedPath -Filter "Assembly_*.dll") {
        Start-Process -FilePath .\AssemblyPublicizer.exe -WorkingDirectory $ManagedPath -ArgumentList @("-i", "$file") -Wait -NoNewWindow
    }
}
else {
    Write-Host "Couldn't find path for Valheim"
}
