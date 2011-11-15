require 'test_helper'

class Admin::ProfileQuestionsControllerTest < ActionController::TestCase
  setup do
    @admin_profile_question = admin_profile_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_profile_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_profile_question" do
    assert_difference('Admin::ProfileQuestion.count') do
      post :create, admin_profile_question: @admin_profile_question.attributes
    end

    assert_redirected_to admin_profile_question_path(assigns(:admin_profile_question))
  end

  test "should show admin_profile_question" do
    get :show, id: @admin_profile_question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_profile_question.to_param
    assert_response :success
  end

  test "should update admin_profile_question" do
    put :update, id: @admin_profile_question.to_param, admin_profile_question: @admin_profile_question.attributes
    assert_redirected_to admin_profile_question_path(assigns(:admin_profile_question))
  end

  test "should destroy admin_profile_question" do
    assert_difference('Admin::ProfileQuestion.count', -1) do
      delete :destroy, id: @admin_profile_question.to_param
    end

    assert_redirected_to admin_profile_questions_path
  end
end
