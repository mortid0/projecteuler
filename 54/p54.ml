open Printf
open Batteries.File
open Batteries.Enum

let c = lines_of "poker.txt";;

let _ = iter (print_endline) c;;
