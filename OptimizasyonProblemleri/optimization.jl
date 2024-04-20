using Ipopt
using JuMP
using GLPK
using Plots

# https://www.youtube.com/watch?v=q7JTh2eOYlo

# soru 1

model = Model(Ipopt.Optimizer)

@variable(model, x, start=0)
@variable(model,y ,start=0)

@NLconstraint(model, x + 3y == 18)

@NLobjective(model,Max,x*y)

optimize!(model)

value(x)

value(y)

objective_value(model)

#plot

plotlyjs(size=(1366,768))

max_(y) = (18 - 3y) * y 

y = 0:0.1:30

p = plot(y, max_,
    title = "x * y nin max değeri",
    xlabel = "x",
    ylabel = "x * y"
)

savefig(p,"soru_1.svg")

# soru 2 nehir sorusu

model = Model(Ipopt.Optimizer)

@variable(model, x, start = 0) # alanın x kenarı
@variable(model, y, start = 0) # alanın y kenarı


@NLconstraint(model,2x + y == 200) # diktörgenin çevresi 200 eşittir belirttik şartını

@NLobjective(model, Max, x * y)

optimize!(model)

value(x)

value(y)

objective_value(model)

#plot

# y = (200 - 2x) / 2

# alan : x * y = x * (200 - 2x) / 2

alan(x) = x * (200 - 2x)

x = 0:100

p = plot(x, alan,
    title = "maximum alani bul",
    xlabel = "x in uzunlugu (m)",
    ylabel = "alan (m*m)"
)

savefig(p, "soru_2.svg")

# soru 3 : 400 cm * cm lik kartondan üstü açık kare dük prizma max hacim ne olur ?

model = Model(Ipopt.Optimizer)

@variable(model, x, start = .1)
@variable(model, y, start = .1)

# toplam alan taban alan = x * x , yanal alanlar toplamı = 4 x*y

# 400 = x * x + 4xy

@NLconstraint(model,x*x + 4*x*y == 400)

# hedef olarak maximum hacim istiyoruz tabal alan * yükseklik prizma nın hacim

# hacim = x^2 * y

@NLobjective(model, Max, x * x * y)

optimize!(model)

value(x)# x in değer 20 / √3 == 

value(y)

objective_value(model)

# plot 

hacim(x) = 100x - (x*x*x/4)

x = 1:20

p = plot(x, hacim,
    title = "max hacim ne",
    xlabel =  "x (cm)",
    ylabel = "alan (cm * cm * cm)"
)

savefig(p, "soru_3.svg")

# soru 4

# f(x) = x^2 - 5x + 4 korrdinatları toplamı en küçük olan nokta hangisi


model = Model(Ipopt.Optimizer)

@variable(model, x, start = -1000)
@variable(model, y, start = -1000)

@NLconstraint(model, 2x-4 == 0 ) # burda türev yaptıktan sonra 0 a eşitledik

@NLobjective(model, Min, x^2 - 4*x + 4)

optimize!(model)

value(x)

value(y)

objective_value(model)

# plot
f(x) = x^2 - 4x + 4
x = -3:5

p = plot(x, f,
    title = "f(x) = x^2 - 4x + 4",
    xlabel = "x değeri",
    ylabel = "(x^2 -5x +4, x) (x ve y nin toplamı)"
)

savefig(p, "soru_4.svg")