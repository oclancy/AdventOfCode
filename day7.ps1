. .\day7input.ps1

$quit = $false
$count = 1
$rootBag = @("shiny gold")
while($quit -eq $false)
{
    $quit = $true
    foreach($rule in $rules)
    {
        
        $parts = $rule -split "contain" 
        $bag=$parts[0].Split( ' ' ) | Select-Object -index 0,1  | Join-String -Separator ' '
        $restBags = $parts[1].Split(',') | ForEach-Object { $_.Split( " ") | Select-Object -Index 2,3 | Join-String -Separator ' ' }

        foreach($r in $restBags)
        {
            if($rootBag.Contains($r) -and !$rootBag.Contains($bag) )
            {
                $rootBag += @($bag)
                $quit = $false
            }
        }
    }
}
$rootBag.Count