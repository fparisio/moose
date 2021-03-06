[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 1
  []
[]

[UserObjects]
  active = ''
  [study]
    type = RepeatableRayStudy
    start_points = '0 0 0'
    directions = '1 0 0'
    names = 'ray'
    ray_kernel_coverage_check = false
  []
  [another_study]
    type = RepeatableRayStudy
    start_points = '0 0 0'
    directions = '1 0 0'
    names = 'ray'
    ray_kernel_coverage_check = false
  []
  [not_a_study]
    type = VerifyElementUniqueID
  []
[]

[RayBCs]
  active = ''
  [missing_study_by_name]
    type = NullRayBC
    boundary = top
    study = dummy
    rays = 'ray'
  []
  [not_a_study]
    type = NullRayBC
    boundary = top
    study = not_a_study
    rays = 'ray'
  []
  [multiple_studies]
    type = NullRayBC
    boundary = top
    rays = 'ray'
  []
  [missing_study]
    type = NullRayBC
    boundary = top
    rays = 'ray'
  []
[]

[Problem]
  solve = false
[]

[Executioner]
  type = Steady
[]
