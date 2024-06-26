require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = tasks(:task1)
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
end
