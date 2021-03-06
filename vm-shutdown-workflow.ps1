workflow vm-shutdown-workflow
{

    # 定数定義
    $VMName = "web01"
    $ResourceGroupName = "msp_web_01"

    # Azureへ接続
    Write-Output "Logging in Azure"
    $Conn = Get-AutomationConnection -Name AzureRunAsConnection
    Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

    # 対象VMを取得
    Write-Output "Getting vm"
    $VM = Get-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName

    # 対象VMを停止
    Write-Output "Stopping vm"
    $StopResult = Stop-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName -Force

    Write-Output "VM stopped."

}
