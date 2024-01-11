Shut down task:

```pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -Uri "https://github.com/tim-gromeyer/scripts/raw/main/shutdown/shutdownTask.ps1" -OutFile "$env:TEMP\shutdownTask.ps1"; & "$env:TEMP\shutdownTask.ps1"
```
