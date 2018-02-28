class EmployeesController < ApplicationController
  #before_action :logged_in_employee, only: [:edit, :update, :destroy]
  #before_action :set_employee, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_employee, except: [:index]#, :only => [:show, :new, :edit, :update, :destroy]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_employee, only: [:new, :create]
  #before_action :save_login_state, only: [:new, :create]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  def browser_action

  end 
  # GET /employees/new
  def new
    @employee = Employee.new    
    #@employee.email_addrs.new
    #@employee.email_addr.build
    #@email_addrs_attributes = @employee.email_addrs.build

  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create    
    @employee = Employee.new(employee_params)    
    respond_to do |format|
      if @employee.save
        log_in @employee
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        byebug
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    #if logged_in?
      if @employee.id == session[:employee_id] 
        log_out
      end
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
        format.json { head :no_content }
      end
    #else 
    #  flash[:notice] = "You need to log in to perform this action"
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee      
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :username, :password, :password_confirmation, {email_addrs_attributes: [:id, :mailbox, :domain]})
    end
end
