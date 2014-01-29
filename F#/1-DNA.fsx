let data = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
let chars = data.ToCharArray()

let A, other = Array.Parallel.partition (fun c -> c = 'A') chars
let C, other2 = Array.Parallel.partition (fun c -> c = 'C') other
let G, T = Array.Parallel.partition (fun c -> c = 'G') other2

printfn "%d %d %d %d" (Array.length A) (Array.length C) (Array.length G) (Array.length T)
