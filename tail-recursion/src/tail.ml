let opt = ref false
let input = ref ""
let options = [ ("-opt", Arg.Set opt, "Optimized version") ]
let rec length_unopt l = match l with [] -> 0 | _ :: t -> 1 + length_unopt t
let rec length_opt len l = 
  match l with
  [] -> len
  | _:: t -> length_opt (len + 1) t

let main () =
  Arg.parse options (fun x -> input := x) "";
  let n = int_of_string !input in
  let length = if !opt then length_opt 0 else length_unopt in
  List.init n (fun _ -> 0) |> length |> Printf.printf "%d\n"

let _ = main ()
