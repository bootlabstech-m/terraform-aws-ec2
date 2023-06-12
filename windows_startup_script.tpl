# Change execution policy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
cd\
md temp
cd temp

# Download the package
Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.6.2-windows-x86_64.zip -OutFile elastic-agent-8.6.2-windows-x86_64.zip

# Restore the previous execution policy
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process -Force

# Extract and install the package
Expand-Archive .\elastic-agent-8.6.2-windows-x86_64.zip -DestinationPath .
cd elastic-agent-8.6.2-windows-x86_64
.\elastic-agent.exe install --url=https://6d7f607d7dde4bebb494f4442612e81c.fleet.asia-south1.gcp.elastic-cloud.com:443 --enrollment-token=S21XcTJZWUIzVFM3bm9iQVY2c246VTNVRlE1WFVROWlMSXUwWldjM2RhZw== --force --tag azure,windows