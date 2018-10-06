
param (
# context path to send to the docker build
[Parameter(Mandatory)]
[string]
$Context,
# tag for the image
[string]
$Tag = "jss:cli"
)

&docker build --platform=linux --target cli --tag $Tag $Context