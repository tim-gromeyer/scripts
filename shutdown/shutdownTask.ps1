$action = New-ScheduledTaskAction -Execute 'shutdown' -Argument '/s /f /t 0'
$trigger = New-ScheduledTaskTrigger -Daily -At 9:12am
Register-ScheduledTask -TaskName "Shutdown Task" -Action $action -Trigger $trigger