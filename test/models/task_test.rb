require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @project = projects(:project1) # Assuming you have fixtures for projects
    @task = @project.tasks.build(title: 'Example Task', description: 'Lorem ipsum', due_date: Date.current)
  end

  test 'should be valid' do
    assert @task.valid?
  end

  test 'title should be present' do
    @task.title = '   '
    assert_not @task.valid?
  end

  test 'title should not be too long' do
    @task.title = 'a' * 101
    assert_not @task.valid?
  end

  test 'associated project should be present' do
    @task.project = nil
    assert_not @task.valid?
  end

  test 'default scope should order tasks by position' do
    # Assuming you have acts_as_list set up
    assert_equal @project.tasks.order(position: :asc), Task.all
  end
end
