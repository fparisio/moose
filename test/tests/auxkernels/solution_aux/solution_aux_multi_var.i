[Mesh]
    file = cubesource.e
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
  [../]
[]

[AuxVariables]
  [./nn]
    order = FIRST
    family = LAGRANGE
  [../]
  [./en]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = u
  [../]
[]

[AuxKernels]
  [./nn]
    type = SolutionAux
    solution = soln
    variable = nn
    scale_factor = 2.0
    from_variable = nodal_10
    add_factor = -20
  [../]
  [./en]
    type = SolutionAux
    solution = soln
    variable = en
    scale_factor = 2.0
    from_variable = source_nodal
  [../]
[]

[UserObjects]
  [./soln]
    type = SolutionUserObject
    mesh = cubesource_added.e
    variables = 'source_nodal nodal_10'
    timestep = 2
  [../]
[]

[BCs]
  [./stuff]
    type = DirichletBC
    variable = u
    boundary = '1 2'
    value = 0.0
  [../]
[]

[Executioner]
  type = Transient
  petsc_options = '-snes'
  l_max_its = 800
  nl_rel_tol = 1e-10
  num_steps = 50
  end_time = 5
  dt = 0.5
[]

[Output]
  exodus = true
  perf_log = true
[]
