## Written by Alix Hoover
## Created on 6/30/2016
## It checks the whole subnet for live nodes. then Tees off from the screen to a report file for future reference.


Write-host "First 3 of the subnet no trailing dot.  EX 192.168.0 :" -foregroundcolor magenta -nonewline
$subnet = read-host
$reportfile = ".\Subnet " +$subnet+" report.csv"


$ping = New-Object System.Net.Networkinformation.Ping
1..254 | % { $ping.send($subnet+".$_”) | select address, status } | Tee-Object -file $reportfile
