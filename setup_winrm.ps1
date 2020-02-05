# 引数としてアクセス許可IPを記載する
Param($access_from_ip)


# WinRMを有効化
Enable-PSRemoting -SkipNetworkProfileCheck
# WinRM初期設定
Set-WSManQuickConfig -Force

# FirewallにWinRMポートを追加
#New-NetFirewallRule -DisplayName "WinRM(TCP:5985)" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985 -RemoteAddress "$access_from_ip"
# 上記だとインターネットから接続できない
# 開発向けにFW無効化
Get-NetFirewallProfile | Set-NetFirewallProfile -Enabled false

# WinRMの基本認証と非暗号化通信の許可
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}
winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/client @{AllowUnencrypted="true"}


