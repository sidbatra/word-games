module SolverHelper
  
  def apply_active_class(operation,current_operation)
    raw operation == current_operation ? 'class="active"' : ""
  end
end
