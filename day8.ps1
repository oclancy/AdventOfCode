. .\day8input.ps1

$quit = $false
$changeIndex=0
while( -not $quit)
{
    $ops = $source.Clone()

    while( (-not $ops[$changeIndex].Contains( "nop" )) -and ( -not $ops[$changeIndex].Contains( "jmp") ))
    {
        $changeIndex+=1
    }
    if($ops[$changeIndex].Contains("nop"))
    {
        $ops[$changeIndex] = $ops[$changeIndex].Replace("nop","jmp")
    }
    elseif($ops[$changeIndex].Contains("jmp"))
    {
        $ops[$changeIndex] = $ops[$changeIndex].Replace("jmp","nop")
    }
    $changeIndex+=1
    $acc = 0
    $index = 0
    $done = @{}

    while($true)
    {
        if($index -ge $ops.Count){
            $quit = $true
            break
        }

        if($done.ContainsKey($index)){
            break
        }

        $done.Add($index, 1)
        $parts = $ops[$index].Split(' ')
        $action = $parts[0]

        switch($action)
        {
            "nop"{ $index += 1 }
            "acc"{
                $chars = $parts[1].ToCharArray()
                if($chars[0] -eq '+'){ $acc += $parts[1].SubString(1) -as [int] }
                else{ $acc -= $parts[1].SubString(1) -as [int] }
                $index += 1
            }
            "jmp"{
                $chars = $parts[1].ToCharArray()
                if($chars[0] -eq '+'){ $index += $parts[1].SubString(1) -as [int] }
                else{ $index -= $parts[1].SubString(1) -as [int] }
            }
        }
        
    }
}
$acc