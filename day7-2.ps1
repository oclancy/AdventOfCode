. .\day7input2.ps1

$count = 0


function getbagcount([string] $searchBag)
{
    $retVal=0
    foreach($rule in $rules)
    {
        $parts = $rule -split "contain" 
        $bag=$parts[0].Split( ' ' ) | Select-Object -index 0,1  | Join-String -Separator ' '
        if($bag -eq $searchBag)
        {
            if($parts[1] -eq " no other bags.")
            {
                return 0
            }
            else{
                $restBags = $parts[1].Split(',')
                
                foreach( $rb in $restBags)
                {
                    $r = $rb.Split(' ')
                    $retVal += ($r[1] -as [int]) * ( getbagcount( $r | Select-Object -Index 2,3 | Join-String -Separator ' ') )
                    $retVal += ($r[1] -as [int])
                }
                return $retVal
            }
           
        }
    }
}

$count += getbagcount("shiny gold")
$count
