require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = projects(:project1)
  end

  test 'should be valid' do
    assert @project.valid?
  end

  test 'name should be present' do
    @project.name = '   '
    assert_not @project.valid?
  end

  test 'name should not be too long' do
    @project.name = 'a' * 256
    assert_not @project.valid?
  end

  test 'associated tasks should be destroyed' do
    @project.save
    @project.tasks.create!(title: 'Example Task', description: 'Lorem ipsum', due_date: Date.current)
    assert_difference 'Task.count', -1 do
      @project.destroy
    end
  end
end
