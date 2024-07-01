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

ohm(R(5),I(4))
ohm(V(5),R(4))
ohm(V(5),I(5))