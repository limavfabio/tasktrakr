class ProjectsController < ApplicationController
  include CollaboratorAddition

  before_action :authenticate_user!
  before_action :set_projects, only: %i[inbox show]
  before_action :set_project, only: %i[show edit update destroy add_collaborator]
  before_action :set_inbox, only: %i[inbox show]

  # GET /projects/inbox
  def inbox
    @project = @inbox

    render template: 'index/show'
  end

  # GET /projects/1 or /projects/1.json
  def show
    authorize! :manage, @project

    render template: 'index/show'
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save

        # Associate created project with the current_user
        current_user.user_projects.create(project: @project)

        format.html { redirect_to project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /projects/1/add_collaborator
  def add_collaborator
    email = params[:email].downcase
    user = User.find_by(email: email.downcase)

    if check_collaborator_by_email(email)
      @project.users << user
      @project.save
    end

    redirect_to project_path(@project)
  end

  private

  def set_projects
    @projects = current_user.projects.where(is_inbox: false)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_inbox
    @inbox = current_user.projects.find_by is_inbox: true
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name)
  end
end
