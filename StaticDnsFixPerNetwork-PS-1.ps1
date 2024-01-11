$Interfaces = 'hklm:\SYSTEM\ControlSet001\Services\Tcpip\Parameters\Interfaces\'

Get-ChildItem $Interfaces | Where-Object {
    #Only where it contants a key already called "NameServer"
    (Get-ItemProperty -Path $_.PSPath -Name '*NameServer*' -ErrorAction SilentlyContinue)
   
} |

ForEach-Object {
     #Changes each name server to blank
     Set-ItemProperty -Path $_.PSPath -Name 'NameServer' -Type 'String' -Value ''
}
