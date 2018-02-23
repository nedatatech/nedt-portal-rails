class EmployeeTasksController < ApplicationController
  before_action :set_employee_task, only: [:show, :edit, :update, :destroy]

  # GET /employee_tasks
  # GET /employee_tasks.json
  def index
    @employee_tasks = EmployeeTask.all
  end

  # GET /employee_tasks/1
  # GET /employee_tasks/1.json
  def show
  end

  # GET /employee_tasks/new
  def new
    @employee_task = EmployeeTask.new
  end

  # GET /employee_tasks/1/edit
  def edit
  end

  # POST /employee_tasks
  # POST /employee_tasks.json
  def create
    @employee_task = EmployeeTask.new(employee_task_params)

    respond_to do |format|
      if @employee_task.save
        format.html { redirect_to @employee_task, notice: 'Employee task was successfully created.' }
        format.json { render :show, status: :created, location: @employee_task }
      else
        format.html { render :new }
        format.json { render json: @employee_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_tasks/1
  # PATCH/PUT /employee_tasks/1.json
  def update
    respond_to do |format|
      if @employee_task.update(employee_task_params)
        format.html { redirect_to @employee_task, notice: 'Employee task was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_task }
      else
        format.html { render :edit }
        format.json { render json: @employee_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_tasks/1
  # DELETE /employee_tasks/1.json
  def destroy
    @employee_task.destroy
    respond_to do |format|
      format.html { redirect_to employee_tasks_url, notice: 'Employee task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_task
      @employee_task = EmployeeTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_task_params
      params.require(:employee_task).permit(:employee_id, :task_type_id, :description, :status_id)
    end
end
