let line1 = "GAGCCTACTAACGGGAT".ToCharArray()
let line2 = "CATCGTAATGACGGCCT".ToCharArray()

let different char1 char2 = 
    if (char1 = char2) then 
        0
    else
        1

Array.map2 different line1 line2
    |> Array.sum
