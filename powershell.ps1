param($installPath, $toolsPath, $package, $project)

$props = "Common.props"
$template = "$toolsPath\$props"
$destination = "$installPath\..\.."

if(-Not(Test-Path "$destination\$props")) {
    Write-Host "Creating common solution propertis."
    Copy-Item $template -Destination $destination
}


Write-Host "$installPath, $toolsPath, $package, $project"

$p = Get-Project

Write-Host ($p.FullName)

Add-Type -Language CSharp @"
public class Thing{
    public string Name;
}
"@;

$x = New-Object Thing

$x.Name = "Bill"

Write-Output "My name is $($x.Name)"

# This is the MSBuild targets file to add
$targetsFile = [System.IO.Path]::Combine($toolsPath, 'c.lf')

# Need to load MSBuild assembly if it's not loaded yet.
Add-Type -AssemblyName 'Microsoft.Build, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
# Grab the loaded MSBuild project for the project
$msbuild = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | Select-Object -First 1

# Make the path to the targets file relative.
$projectUri = new-object Uri('file://' + $project.FullName)
$targetUri = new-object Uri('file://' + $targetsFile)
$relativePath = $projectUri.MakeRelativeUri($targetUri).ToString().Replace([System.IO.Path]::AltDirectorySeparatorChar, [System.IO.Path]::DirectorySeparatorChar)

# Add the import and save the project
$msbuild.Xml.AddImport($relativePath) | out-null
$project.Save()