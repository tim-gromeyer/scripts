# Aktion für das Herunterfahren definieren
$action = New-ScheduledTaskAction -Execute 'shutdown' -Argument '/s /f /t 0'

# Vordefinierte Zeiten für jede Stunde (unterschiedliche Minuten)
$scheduledTimes = @(
    "00:17", "01:43", "02:08", "03:31", "04:52", "05:14",
    "06:37", "07:03", "08:26", "09:49", "10:12", "11:35",
    "12:58", "13:21", "14:44", "15:07", "16:29", "17:53",
    "18:16", "19:38", "20:02", "21:25", "22:48", "23:11"
)

# Array für alle Trigger erstellen
$triggers = @()

# Für jede vordefinierte Zeit einen Trigger erstellen
foreach ($timeString in $scheduledTimes) {
    # Trigger für diese spezifische Zeit erstellen
    $trigger = New-ScheduledTaskTrigger -Daily -At $timeString
    $triggers += $trigger
    
    Write-Host "Trigger erstellt für: $timeString"
}

# Alle bestehenden Tasks mit diesem Namen löschen (falls vorhanden)
try {
    Unregister-ScheduledTask -TaskName "Hourly Shutdown Task" -Confirm:$false -ErrorAction SilentlyContinue
}
catch {
    # Task existierte nicht, das ist in Ordnung
}

# Neuen Task mit allen Triggern registrieren
Register-ScheduledTask -TaskName "Hourly Shutdown Task" -Action $action -Trigger $triggers

Write-Host "Task 'Hourly Shutdown Task' wurde erfolgreich mit 24 zufälligen Zeiten registriert!"

# Zeige die nächsten geplanten Ausführungen an
Get-ScheduledTask -TaskName "Hourly Shutdown Task" | Get-ScheduledTaskInfo
