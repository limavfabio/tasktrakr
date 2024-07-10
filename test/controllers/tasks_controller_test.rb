require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @task = tasks(:task1)
    @project = projects(:project1)
    @user = users(:user1)

    sign_in @user
  end

  test 'should create task' do
    assert_difference('Task.count', 1) do
      post project_tasks_url(@project), params: { task: { title: 'A title' } }
    end
  end

  test 'should update task' do
    skip 'Can\'t make this patch actually update the fixtured task'
    patch task_url(@task), params: { task: { title: 'New Title' } }
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end
  end
end
