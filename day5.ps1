. .\day5Input.ps1

$source = $source.Split([Environment]::NewLine)

foreach ($item in $source) {
     
    $chars = $item.ToCharArray()
    $ubound =127
    $lbound =0
    $move = 128
    foreach( $pos in 0..6)
    {
        $move = $move / 2
        if($chars[$pos] -eq 'F')
        {
            $ubound = $ubound - $move
            $row = $lbound
        }
        else {
            $lbound = $lbound + $move
            $row = $ubound
        }
    }
    $ubound =7
    $lbound =0
    $move=8
    foreach( $pos in 7..9)
    {
        $move = $move / 2
        if($chars[$pos] -eq 'L')
        {
            $ubound = $ubound - $move
            $column = $lbound
        }
        else {
            $lbound = $lbound + $move
            $column = $ubound
        }
    }

    $seat = ($row * 8) + $column

    $max =[math]::Max($seat,$max)
}

$max