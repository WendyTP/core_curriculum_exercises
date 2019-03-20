# tests methods in this file can be called with "require_relative 'unit_test'"

def tester(test_funct, test_param_list)
  for test_param_unit in test_param_list
    p send(test_funct,test_param_unit)
  end
end