# powerkingscan.ps1
# Data: 28/08/21
# Autor: Reinaldo Garcia
# Descrição: Programa simples escrito em Powershell para executar um portscan nas TOP20 portas

# Valida se o comando foi executado com parametro corretamente
Param($ip)
if (!$ip) {
  Write-Output "POWERKINGSCAN - PORSTSCAN"
  Write-Output "Execute o programa e insira o endereço IP do alvo em seguida"
  Write-Output "Modo de uso: .\powerkingscan.ps1 192.168.0.1"
 } 
else {
    # Define as 20 portas mais utilizadas
    $topports = 21,22,23,25,53,80,110,111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080
    try {foreach ($porta in $topports){
        if (Test-NetConnection $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet) {
            Write-Output "Porta $porta Aberta"}} 
            else {
                Write-Output "Porta $porta fechada"
                }} catch {}
                }
