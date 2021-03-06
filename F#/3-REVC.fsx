let data = "AAAACCCGGT"

let complement symbol = 
    match symbol with 
        | 'A' -> "T"
        | 'T' -> "A"
        | 'C' -> "G"
        | 'G' -> "C"
        | _ -> failwith "wtf"

let comp = data.ToCharArray() 
            |> Array.Parallel.map complement
            |> Array.rev
            |> Array.reduce (+) 

printfn "%s" comp