require 'test_helper'

class AmsControllerTest < ActionController::TestCase
  setup do
    @am = ams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create am" do
    assert_difference('Am.count') do
      post :create, am: { fecha: @am.fecha, hb: @am.hb, hto: @am.hto, ktv: @am.ktv, paciente_id: @am.paciente_id, peso_post: @am.peso_post, peso_pre: @am.peso_pre, tgo: @am.tgo, tgp: @am.tgp, urea_post: @am.urea_post, urea_pre: @am.urea_pre, urr: @am.urr }
    end

    assert_redirected_to am_path(assigns(:am))
  end

  test "should show am" do
    get :show, id: @am
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @am
    assert_response :success
  end

  test "should update am" do
    patch :update, id: @am, am: { fecha: @am.fecha, hb: @am.hb, hto: @am.hto, ktv: @am.ktv, paciente_id: @am.paciente_id, peso_post: @am.peso_post, peso_pre: @am.peso_pre, tgo: @am.tgo, tgp: @am.tgp, urea_post: @am.urea_post, urea_pre: @am.urea_pre, urr: @am.urr }
    assert_redirected_to am_path(assigns(:am))
  end

  test "should destroy am" do
    assert_difference('Am.count', -1) do
      delete :destroy, id: @am
    end

    assert_redirected_to ams_path
  end
end
