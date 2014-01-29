let findWabbits n k = 
    Seq.unfold(fun(a,b) ->  Some( b, (b, b+a*k) )) (0L,1L)
        |> Seq.nth (n-1)

findWabbits 5 3L
