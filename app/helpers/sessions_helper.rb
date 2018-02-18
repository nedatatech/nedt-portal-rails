module SessionsHelper
  #log in given employee
  def log_in(employee)  	
    session[:employee_id] = employee.id
  end

  # Returns the current logged-in emplyee (if any).
  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?  	
    !current_employee.nil?
  end

  def log_out
    session.delete(:employee_id)
    @current_user = nil
  end
 # def logged_in?
 # 	byebug
 #   if session[:employee_id]
 #     # set current employee object to @current_employee object variable
 #     @current_employee = Employee.find session[:employee_id] 
 #     return true 
 #   else
 #     flash[:notice] = "Please log in."
 #     redirect_to employees_url
 #     return false
 #   end
 # end
end
