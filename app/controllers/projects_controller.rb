class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :destroy]
  # before_action :set_user

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    
  end

  # GET /projects/new
  def new
   @project = Project.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      @current_user  = User.find_by_username([session[:username]])
       @current_user.projects << @project
       flash[:notice] = 'Project was successfully created.' 
       redirect_to(:controller => 'access', :action => 'index')
        
    else
      render('new')
    end
  end

  def edit
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
      if @project.update(project_params)
        flash[:notice] = 'Project was successfully updated.' 
        redirect_to(:controller => 'access', :action => 'index')
      else
        render('edit')
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.destroy
      flash[:notice] ='Project was successfully destroyed.' 
      redirect_to(:controller => 'access', :action => 'index')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # def set_user
    #   if params[:user_id]
    #     @user = User.find(params[:user_id])
    #   end
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
