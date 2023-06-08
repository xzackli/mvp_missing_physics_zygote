using OrdinaryDiffEq, Lux, Enzyme, Random
rng = Random.default_rng()

tspan = (0.0f0, 5.0f0)
u0 = 5.0f0 * rand(rng, Float32, 2)

rbf(x) = exp.(-(x .^ 2))

# Multilayer FeedForward

NETWORK_SIZE::Int = 512  # is 5 in the example
U = Lux.Chain(
    Lux.Dense(2, NETWORK_SIZE, rbf), 
    Lux.Dense(NETWORK_SIZE, 2))

# Get the initial parameters and state variables of the model
p, st = Lux.setup(rng, U)

# Define the hybrid model
function ude_dynamics!(du, u, p, t, p_true)
    û = U(u, (p), st)[1] # Network prediction
    du[1] = p_true[1] * u[1] + û[1]
    du[2] = -p_true[4] * u[2] + û[2]
end


# Closure with the known parameter
p_ = Float32[1.3, 0.9, 0.8, 1.8]
nn_dynamics!(du, u, p, t) = ude_dynamics!(du, u, p, t, p_)
# Define the problem
prob_nn = ODEProblem(nn_dynamics!, u0, tspan, (p))

##
x = deepcopy(u0) # Intial values
dx = similar(x)
d_dx = similar(dx)
d_x = similar(x)
t = 0.0f0
d_p = deepcopy(p)
nn_dynamics!(dx,x,p,t)

##

Enzyme.autodiff(Enzyme.Reverse, nn_dynamics!, Duplicated(dx, d_dx), Duplicated(x, d_x), Duplicated(p, d_p), Enzyme.Const(t));




