# multiple dispatch cok kullanisli


#=
multiplication of voltage and current

voltage = V
current = I
resistance = R

V = R*I

I = V/R

R = V/I

f(r::R, i::I) = V(r.r * i.i)

f(v::V, r::R) = I(v.v / r.r)

f(v::V, i::I) = R(v.v / i.i)


=#

struct I 
    i::Float64
end
struct V
    v::Float64
end
struct R
    r::Float64
end
f(r::R, i::I) =return V(r.r * i.i)
f(v::V, r::R) =return I(v.v / r.r)
f(v::V, i::I) =return R(v.v / i.i)
f(R(5),I(4))

function ohm(a,b)
    return f(a,b)
end

# örnek kullanim
# arduino icin 5v gerilimde , led icin direnc hesabi
res =ohm(V(5),I(0.020))# burda 20 mili amper ile calisan led icin ne kadarlik direnc gerek
println("kullanim\n
5v cikisli arduino da 20 mili amper akimla calisan led icin direnc hesabi
\nohm(V(5),I(0.020)) \ndirenc = $res Ω")