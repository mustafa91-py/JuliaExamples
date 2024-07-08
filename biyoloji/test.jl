
include("sequence.jl")
using BenchmarkTools
dna = "ATGCA"^200
@time e = parse_dna2(dna, 99) # bu yaklasik 36-40 saniye de


include("my_example.jl")  # bu ise yaklasık 120-140 saniye de
@time e = parse_dna2(dna, 99) # bu ise yaklasık 120-140 saniye de
