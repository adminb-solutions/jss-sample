param(
    # Command to execute with the jss cli
    [Parameter(Mandatory)]
    [string]
    $Command,
    # image to create the container from    
    [string]
    $Image="jss:cli",
    # network, to make sure it talks to Sitecore
    [string]
    $Network,
    # Ports to bind, by default 3000:3000
    [string]
    $Port="3000:3000",
    # Interactive shell
    [Switch]
    $Interactive
)

$root = $PSScriptRoot
$workspace_path = "$root\..\sitecore\workspace"
if(-not(test-path $workspace_path)){
    new-item -ItemType Directory -Path $workspace_path
}
$cmd_args = "--platform=linux --rm -m 4Gb -v ${workspace_path}:/workspace -e CHOKIDAR_USEPOLLING -p $Port"

if($Interactive){
    $cmd_args+=" -ti"
}
else {
    $cmd_args+=" -d"
}

if($Network){
    $cmd_args+=" --network $Network"
}

Invoke-Expression -Command "docker run $cmd_args $Image $Command"