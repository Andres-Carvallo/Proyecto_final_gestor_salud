require 'test_helper'

class CollaboratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collaborator = collaborators(:one)
  end

  test "should get index" do
    get collaborators_url
    assert_response :success
  end

  test "should get new" do
    get new_collaborator_url
    assert_response :success
  end

  test "should create collaborator" do
    assert_difference('Collaborator.count') do
      post collaborators_url, params: { collaborator: { email: @collaborator.email, name: @collaborator.name, percentage_profit: @collaborator.percentage_profit, phone_number: @collaborator.phone_number, profit_amount: @collaborator.profit_amount } }
    end

    assert_redirected_to collaborator_url(Collaborator.last)
  end

  test "should show collaborator" do
    get collaborator_url(@collaborator)
    assert_response :success
  end

  test "should get edit" do
    get edit_collaborator_url(@collaborator)
    assert_response :success
  end

  test "should update collaborator" do
    patch collaborator_url(@collaborator), params: { collaborator: { email: @collaborator.email, name: @collaborator.name, percentage_profit: @collaborator.percentage_profit, phone_number: @collaborator.phone_number, profit_amount: @collaborator.profit_amount } }
    assert_redirected_to collaborator_url(@collaborator)
  end

  test "should destroy collaborator" do
    assert_difference('Collaborator.count', -1) do
      delete collaborator_url(@collaborator)
    end

    assert_redirected_to collaborators_url
  end
end