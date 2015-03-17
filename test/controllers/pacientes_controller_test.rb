require 'test_helper'

class PacientesControllerTest < ActionController::TestCase
  setup do
    @paciente = pacientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pacientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente" do
    assert_difference('Paciente.count') do
      post :create, paciente: { apellido_materno: @paciente.apellido_materno, apellido_paterno: @paciente.apellido_paterno, departamento: @paciente.departamento, direccion: @paciente.direccion, distrito: @paciente.distrito, dni: @paciente.dni, email: @paciente.email, nacimiento: @paciente.nacimiento, primer_nombre: @paciente.primer_nombre, provincia: @paciente.provincia, segundo_nombre: @paciente.segundo_nombre }
    end

    assert_redirected_to paciente_path(assigns(:paciente))
  end

  test "should show paciente" do
    get :show, id: @paciente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paciente
    assert_response :success
  end

  test "should update paciente" do
    patch :update, id: @paciente, paciente: { apellido_materno: @paciente.apellido_materno, apellido_paterno: @paciente.apellido_paterno, departamento: @paciente.departamento, direccion: @paciente.direccion, distrito: @paciente.distrito, dni: @paciente.dni, email: @paciente.email, nacimiento: @paciente.nacimiento, primer_nombre: @paciente.primer_nombre, provincia: @paciente.provincia, segundo_nombre: @paciente.segundo_nombre }
    assert_redirected_to paciente_path(assigns(:paciente))
  end

  test "should destroy paciente" do
    assert_difference('Paciente.count', -1) do
      delete :destroy, id: @paciente
    end

    assert_redirected_to pacientes_path
  end
end
