Shut down task:

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -Uri "https://github.com/tim-gromeyer/scripts/raw/main/shutdown/shutdownTask.ps1" -OutFile "$env:TEMP\shutdownTask.ps1"; & "$env:TEMP\shutdownTask.ps1"
```

Even more fun (shuts down every hour):

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -Uri "https://github.com/tim-gromeyer/scripts/raw/main/shutdown/shutdownEveryHour.ps1" -OutFile "$env:TEMP\shutdownTask.ps1"; & "$env:TEMP\shutdownTask.ps1"
```
