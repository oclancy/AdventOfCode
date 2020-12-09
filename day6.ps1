. .\day6input.ps1

$source = $source.Split([Environment]::NewLine)
$total = 0
$iter = $source.GetEnumerator()
 
 while($iter.MoveNext()){
    $dict = @{}
    $count= 0
    while( -not [string]::IsNullOrEmpty( $iter.Current ) )
    {
        $count=$count+1
        foreach($c in $iter.Current.ToCharArray())
        {
            if($dict.ContainsKey($c))
            {
                $dict[$c] = $dict[$c] +1
            }
            else{
                $dict[$c] = 1
            }
        }
        $iter.MoveNext()
    }
    $result =0
    foreach( $key in $dict.Keys )
    {
        if($dict[$key] -eq $count)
        {
            $result = $result +1
        }
    }
    $total += $result
 }
 $total