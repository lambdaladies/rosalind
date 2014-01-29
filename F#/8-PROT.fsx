let data = Array.map (fun x -> x.ToString()) <| "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA".ToCharArray()

let getProtCode = function 
    |"UUU"|"UUC" -> "F"
    |"CUU"|"CUC"|"UUA"|"CUA"|"UUG"|"CUG" -> "L"
    |"AUU"|"AUC"|"AUA" -> "I"
    |"GUU"|"GUC"|"GUA"|"GUG" -> "V"
    |"AUG"-> "M"
    |"UCU"|"UCC"|"UCA"|"UCG"|"AGU"|"AGC" -> "S"
    |"CCU"|"CCC"|"CCA"|"CCG" -> "P"
    |"ACU"|"ACC"|"ACA"|"ACG" -> "T"
    |"GCU"|"GCC"|"GCA"|"GCG" -> "A"
    |"UAU"|"UAC" -> "Y"
    |"CAU"|"CAC" -> "H"
    |"AAU"|"AAC" -> "N"
    |"GAC"|"GAU" -> "D"
    |"UAA"|"UAG"|"UGA" -> ""//Stop
    |"CAA"|"CAG" -> "Q"
    |"AAA"|"AAG" -> "K"
    |"GAA"|"GAG" -> "E"
    |"UGU"|"UGC" -> "C"
    |"CGU"|"CGC"|"CGA"|"AGA"|"CGG"|"AGG" -> "R"
    |"GGU"|"GGC"|"GGA"|"GGG" -> "G"
    |"UGG" -> "W"
    | _ -> failwith "oops" 

let convert element = 
    let subProtCode el = 
        let start = el-2
        getProtCode (data.[start..el] |> Array.reduce (+))

    match element%3 with 
        |0|1 -> ""
        |2 -> subProtCode element
        |_ -> failwith <| element.ToString()

let elements = [|1..data.Length|]

Array.map convert elements |> Array.reduce (+)
