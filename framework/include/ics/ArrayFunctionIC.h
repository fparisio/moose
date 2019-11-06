//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ArrayInitialCondition.h"

// Forward Declarations
class ArrayFunctionIC;
class Function;

template <>
InputParameters validParams<ArrayFunctionIC>();

class ArrayFunctionIC : public ArrayInitialCondition
{
public:
  ArrayFunctionIC(const InputParameters & parameters);

  static InputParameters validParams();

protected:
  /**
   * The value of the variable at a point.
   */
  virtual RealEigenVector value(const Point & p) override;

  /**
   * The value of the gradient at a point.
   */
  virtual RealVectorArrayValue gradient(const Point & p) override;

  std::vector<const Function *> _func;
};
