class TaskChannel < ApplicationCable::Channel
  def subscribed
    stream_from "task:#{params[:project_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def edit(data)
    task = Task.find(data['id'])
    task.update(data['task_params'])
    broadcast_to_task(task)
  end

  def destroy(data)
    task = Task.find(data['id'])
    task.destroy
    broadcast_to_task(task)
  end

  private

  def broadcast_to_task(task)
    ActionCable.server.broadcast("task:#{task.project_id}", task: render_task(task))
  end

  def render_task(task)
    ApplicationController.render(
      partial: 'tasks/task',
      locals: { task: task }
    )
  end
end
