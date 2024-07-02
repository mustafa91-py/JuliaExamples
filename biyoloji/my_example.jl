dna = "ATGCATatgc"
length(dna)

function parse_dna(dna::String,fragmentation::Int64)

    f = fragmentation

    out = []

    for i in 1:f
        a = [dna[s:s+f-1] for s in i:f:length(dna[f:end])]
        #(length(a) < 1) ? push!(out,a) : ([push!(out,i) for i in a])
        [push!(out,i) for i in a]
        end

        return out

    end


parse_dna(dna,5)
sort(parse_dna(dna,5),by=x -> uppercase(x[1]))
struct Fragment
    first::Int64
    base::String
    last::Int64
end    

function parse_dna2(dna::String,fragmentation::Int64)

        f = fragmentation
    
        out = []
        
        for i in 1:f
            
            a = [Fragment(s,dna[s:s+f-1],s+f-1) for s in i:f:length(dna[f:end])]
    
            [push!(out,i) for i in a]
            end
    
            return out
    
        end
        
@time e = parse_dna2(dna,3)
@time sort!(e,by=x -> x.last)
#=
  0.718372 seconds (10.00 M allocations: 686.646 MiB, 40.65% gc time)
  432.901 ms (10000002 allocations: 686.65 MiB)
=#