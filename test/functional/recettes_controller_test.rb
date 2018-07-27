require 'test_helper'

class RecettesControllerTest < ActionController::TestCase
  setup do
    @recette = recettes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recettes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recette" do
    assert_difference('Recette.count') do
      post :create, recette: { accompagnement: @recette.accompagnement, auteur: @recette.auteur, cuisson: @recette.cuisson, ingredient: @recette.ingredient, instruction: @recette.instruction, marinage: @recette.marinage, note: @recette.note, portion: @recette.portion, preparation: @recette.preparation, source: @recette.source, titre: @recette.titre, vin: @recette.vin }
    end

    assert_redirected_to recette_path(assigns(:recette))
  end

  test "should show recette" do
    get :show, id: @recette
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recette
    assert_response :success
  end

  test "should update recette" do
    put :update, id: @recette, recette: { accompagnement: @recette.accompagnement, auteur: @recette.auteur, cuisson: @recette.cuisson, ingredient: @recette.ingredient, instruction: @recette.instruction, marinage: @recette.marinage, note: @recette.note, portion: @recette.portion, preparation: @recette.preparation, source: @recette.source, titre: @recette.titre, vin: @recette.vin }
    assert_redirected_to recette_path(assigns(:recette))
  end

  test "should destroy recette" do
    assert_difference('Recette.count', -1) do
      delete :destroy, id: @recette
    end

    assert_redirected_to recettes_path
  end
end
