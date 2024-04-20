# Optimizasyon Problemleri

### [Calculus-I : Optimizasyon Problemleri (Maksimum ve Minimum Problemleri)](https://www.youtube.com/watch?v=q7JTh2eOYlo) 
[![Reference](https://img.youtube.com/vi/q7JTh2eOYlo/0.jpg)](https://www.youtube.com/watch?v=q7JTh2eOYlo)
#### soru 1
```jl
model = Model(Ipopt.Optimizer)

@variable(model, x, start=0)
@variable(model,y ,start=0)

@NLconstraint(model, x + 3y == 18)

@NLobjective(model,Max,x*y)

optimize!(model)

value(x)

value(y)

objective_value(model)
```

![soru1](https://github.com/mustafa91-py/JuliaExamples/blob/main/OptimizasyonProblemleri/soru_1.svg)

#### soru 2
```jl
model = Model(Ipopt.Optimizer)

@variable(model, x, start = 0) # alanın x kenarı
@variable(model, y, start = 0) # alanın y kenarı


@NLconstraint(model,2x + y == 200) # diktörgenin çevresi 200 eşittir belirttik şartını

@NLobjective(model, Max, x * y)

optimize!(model)

value(x)

value(y)

objective_value(model)

```

![soru2](https://github.com/mustafa91-py/JuliaExamples/blob/main/OptimizasyonProblemleri/soru_2.svg)

#### soru 3

```jl
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
```

![soru3](https://github.com/mustafa91-py/JuliaExamples/blob/main/OptimizasyonProblemleri/soru_3.svg)

#### soru 4
```jl
model = Model(Ipopt.Optimizer)

@variable(model, x, start = -1000)
@variable(model, y, start = -1000)

@NLconstraint(model, 2x-4 == 0 ) # burda türev yaptıktan sonra 0 a eşitledik

@NLobjective(model, Min, x^2 - 4*x + 4)

optimize!(model)

value(x)

value(y)

objective_value(model)

```

![soru4](https://github.com/mustafa91-py/JuliaExamples/blob/main/OptimizasyonProblemleri/soru_4.svg)
