include("Trebuchet.jl")

using Trebuchet

# trebuchet = Trebuchet.SeeSawTrebuchet(1.0, 90.0, 0.5, 2.0, sqrt(2))
L1 = 3.0
L2 = 10.0

trebuchet = Trebuchet.SeeSawTrebuchet(1000.0, 1.0, L1, L2, L2 * cos(pi/4))

solution = Trebuchet.solve(trebuchet)

using Gadfly

plot(layer(x = solution[:theta] / pi * 180, y = solution[:speed], Geom.line(), Theme(default_color = colorant"black")),
    layer(x = solution[:theta] / pi * 180, y = solution[:range], Geom.line()),
    Guide.xlabel("Theta"),
    Guide.ylabel(""),
    Guide.title("Projectile Speed and Range for a Seesaw Trebuchet"))

# Projectiles to consider:
#
# - golf ball (mass: 46 g)
# - pumpkin (mass: 4 kg)
# - cow (mass: 1000 kg)