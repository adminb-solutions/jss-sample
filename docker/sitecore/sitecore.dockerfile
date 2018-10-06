FROM sitecore-jss_sitecore:latest

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN New-WebBinding -Name sitecore -Ip * -Port 80 -HostHeader *