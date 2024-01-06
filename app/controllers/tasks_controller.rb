# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy reorder]
  before_action :set_project, only: %i[index new create]

  # GET /tasks or /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @projects = current_user.projects
  end

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        # ActionCable.server.broadcast "task_channel", { type: "create", task: @task }

        @task.broadcast_append_to(@project, target: 'tasks-table', partial: 'index/task_unchecked')
        format.html { head :no_content, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT projects/1/tasks/1 or projects/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)

        if task_params[:completed] == true or task_params[:completed] == '1'
          @task.broadcast_replace(partial: 'index/task_checked')
        else
          @task.broadcast_replace(partial: 'index/task_unchecked')
        end

        format.html { head :no_content, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    project = @task.project
    @task.broadcast_remove_to(project)
    @task.destroy

    respond_to do |format|
      # ActionCable.server.broadcast "task_channel", { type: "destroy", task: @task }

      format.html { head :no_content, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT projects/1/tasks/1 or projects/1/tasks/1.json
  def reorder
    new_position = params[:new_position].to_i
    old_position = @task.position

    @task.insert_at(new_position)
    ActionCable.server.broadcast 'task_channel', { type: 'reorder', task: @task, old_position: }
    @task.project.broadcast_replace(partial: 'index/tasks_table', target: 'tasks-table')

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :completed, :project_id)
  end
end
