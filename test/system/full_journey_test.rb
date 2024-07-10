require 'application_system_test_case'

class FullJourneyTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    @project = projects(:project1)
  end

  test 'full user flow' do
    visit root_path

    # Sign in
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign in'
    assert_selector 'h1', text: @project.name

    # Add project
    find('sl-button', text: 'Add Project').click
    fill_in 'project[name]', with: 'First Project Test'
    find('input[type="submit"][value="Save"]').click
    assert_selector 'h1', text: 'First Project Test'

    # Add task
    find('sl-button', text: 'Add Task').click
    fill_in 'task[title]', with: 'First Task - ProjectTest'
    find('input[type="submit"][value="Save"]').click
    assert_selector 'h3', text: 'First Task - ProjectTest'
  end
end
