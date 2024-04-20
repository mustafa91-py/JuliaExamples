using JuMP
using Plots
using Ipopt

# toplamları 40 olan iki pozitif tamsayının kareleri toplamı min kaçtır

model = Model(Ipopt.Optimizer)

@variable(model, x >= 0)
@variable(model, y >= 0)

@constraint(model, x + y == 40)

@objective(model, Min, x^2 + y^2)

optimize!(model)

value(x)

value(y)

objective_value(model)
