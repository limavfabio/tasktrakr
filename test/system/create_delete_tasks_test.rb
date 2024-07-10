require 'application_system_test_case'

class CreateDeleteTasksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user1)
    @project = projects(:project1)

    sign_in @user
  end
  test 'create and delete a task' do
    skip 'Not implemented yet'
    visit project_path(@project)

    # Add task
    find('sl-button', text: 'Add Task').click
    fill_in 'task[title]', with: 'First Task - ProjectTest'
    find('input[type="submit"][value="Save"]').click
    assert_selector 'h3', text: 'First Task - ProjectTest'

    # Delete task
    find
  end
end
