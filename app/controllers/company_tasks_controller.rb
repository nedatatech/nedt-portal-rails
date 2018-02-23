class CompanyTasksController < ApplicationController
  before_action :set_company_task, only: [:show, :edit, :update, :destroy]

  # GET /company_tasks
  # GET /company_tasks.json
  def index
    @company_tasks = CompanyTask.all
  end

  # GET /company_tasks/1
  # GET /company_tasks/1.json
  def show
  end

  # GET /company_tasks/new
  def new
    @company_task = CompanyTask.new
  end

  # GET /company_tasks/1/edit
  def edit
  end

  # POST /company_tasks
  # POST /company_tasks.json
  def create
    @company_task = CompanyTask.new(company_task_params)

    respond_to do |format|
      if @company_task.save
        format.html { redirect_to @company_task, notice: 'Company task was successfully created.' }
        format.json { render :show, status: :created, location: @company_task }
      else
        format.html { render :new }
        format.json { render json: @company_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_tasks/1
  # PATCH/PUT /company_tasks/1.json
  def update
    respond_to do |format|
      if @company_task.update(company_task_params)
        format.html { redirect_to @company_task, notice: 'Company task was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_task }
      else
        format.html { render :edit }
        format.json { render json: @company_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_tasks/1
  # DELETE /company_tasks/1.json
  def destroy
    @company_task.destroy
    respond_to do |format|
      format.html { redirect_to company_tasks_url, notice: 'Company task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_task
      @company_task = CompanyTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_task_params
      params.require(:company_task).permit(:company_id, :description, :status_id)
    end
end
