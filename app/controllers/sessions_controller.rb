class SessionsController < ApplicationController
  #before_action :authenticate_employee, :only => [:home, :profile, :setting]
  #before_action :save_login_state, :only => [:login, :login_attempt]
  skip_before_action :authenticate_employee, only: [:create, :destroy]

  def create    
    employee = Employee.find_by(username: params[:username])
    if employee && employee.authenticate(params[:password])
    	#byebug
      #session[:employee_id] = employee.id      
      log_in employee
      redirect_to root_url, notice: 'Logged in!'
    else
    	#byebug
      #flash.now.alert = 'Email or password is invalid'
      #flash['Email or password is invalid']
      flash[:notice] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to employees_url, notice: 'Logged out!'
  end

#  def login_attempt
#    authorized_user = Employee.authenticate(params[:username_or_email],params[:login_password])
#    if authorized_user
#      session[:employee_id] = authorized_user.id
#      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
#      redirect_to(:action => 'home')
#    else
#      flash[:notice] = "Invalid Username or Password"
#      flash[:color]= "invalid"
#      render "login"  
#    end
#end

end
