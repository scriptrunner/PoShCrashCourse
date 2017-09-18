
param(
    #[parameter(Mandatory = $true)]
    [string]$a,
    [int]$b
)

"Hello World " + $a

$b + 1
$a + 1


if($a -eq 'a'){
    Write-Output "Weg1 $a"
}
else{
    Write-Output "Weg2 $a"
}

$ar = @('abc', 'bc', 'cdef')

foreach($item in $ar)
{
    $item.Length
    if($item.Length -eq 2){
        break;
    }
}

$i = 1

do  {
    $i++
    $i
}
until ($i -gt 5)

$i = 2
for(;$i -lt 5; $i++ )
{
    $i
}

