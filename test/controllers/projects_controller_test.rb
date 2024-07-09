# frozen_string_literal: true

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @project = projects(:project1)
    @user = users(:user1)

    sign_in @user
  end

  test 'should get inbox' do
    get inbox_projects_path
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, params: { project: { name: @project.name } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test 'should show project' do
    get project_url(projects(:project2))
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project), params: { project: { name: @project.name } }
    assert_redirected_to project_url(@project)
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(projects(:project2))
    end

    assert_redirected_to root_path
  end

  test 'should not destroy inbox project' do
    assert_no_difference('Project.count') do
      delete project_url(projects(:project1))
    end

    assert_redirected_to root_path
  end

  test 'should add collaborator' do
    assert_difference('UserProject.count', 1) do
      post add_collaborator_project_path(projects(:project2)), params: { email: users(:user2).email }
    end
  end

  test 'should remove collaborator' do
    assert_difference('UserProject.count', -1) do
      delete remove_collaborator_project_path(projects(:project4)), params: { user_id: users(:user2).id }
    end
  end
end
