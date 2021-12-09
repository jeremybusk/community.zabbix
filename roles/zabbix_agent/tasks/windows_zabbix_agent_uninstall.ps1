$agent_exec=$args[0]
$agent_conf=$args[1]

$service = Get-Service -Name "zabbix agent" -ErrorAction SilentlyContinue
if ($service.Length -gt 0) {
  stop-service "zabbix agent"
}

if (Test-Path -Path $agent_exec -PathType Leaf){
  $command = "$agent_exec --uninstall -c $agent_conf"
  iex $command
}
