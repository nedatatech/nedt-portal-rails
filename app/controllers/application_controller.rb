class ApplicationController < ActionController::Base  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_employee, except: [:home]
  #before_action :set_employee#, only: [:show, :edit, :update, :destroy]

  include SessionsHelper

#  helper_method :employee_signed_in?, :current_employee

#  protected

#  def authenticate_employee
#  	byebug
#    cookies.delete(:employee_id) && redirect_to(root_url) if current_employee.blank?
#  end

#  def current_employee
#    byebug
#    @current_employee ||= Employee.find_by(id: cookies.signed[:employee_id])
#  end

#  def employee_signed_in?
#    current_employee.present?
#  end

def authenticate_employee
  if session[:employee_id]
     # set current user object to @current_user object variable
    @current_employee = Employee.find session[:employee_id] 
    return true 
  else
    flash[:notice] = "Please log in."
    redirect_to root_url
    return false
  end
end

def save_login_state
  if session[:employee_id]
    redirect_to employees_url
    return false
  else
    flash[:notice] = "Please log in."
    redirect_to employees_url    
    return true
  end
end

  private

#    def logged_in?
 #     #!current_employee.nil?
 #     #@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
 #   end

 #   helper_method :logged_in?

    #def logged_in_employee
      # unless logged_in?
      #    flash[:notice] = "Please log in."
      #    redirect_to employees_url
      # end
    #end
end  
