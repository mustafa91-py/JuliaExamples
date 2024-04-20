using JuMP
using Plots
using Ipopt

# toplamları 40 olan iki pozitif tamsayının kareleri toplamı en düşük kaçtır ?

model = Model(Ipopt.Optimizer)

@variable(model, x >= 0)
@variable(model, y >= 0)

@constraint(model, x + y == 40)

@objective(model, Min, x^2 + y^2)

optimize!(model)

value(x)

value(y)

objective_value(model)

# y = 40 - x


# y^2 = 1600 - 80x + x^2

#y^2 + x^2 = 1600 -80x + 2x^2


# f(x) = 1600 - 80x + 2x^2

f(x) = 1600 - 80x + 2*(x^2)

x = 10:30

plotlyjs(size=(1366,768))

p = plot(x, f,
    title = "x² + y² func grafiği",
    xlabel = "x değerleri",
    ylabel = "x² + y² değerleri"
)

savefig(p,"x+y=40; min(x²+y²).svg")