class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /pacientes
  # GET /pacientes.json
  def index
   @q = Paciente.search(params[:q])
   @pacientes = @q.result.paginate(:page => params[:page], :per_page => 5).order('apellido_paterno ASC')
 end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
    @analisis = Am.where(paciente_id: @paciente.id).order('fecha DESC')
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: "El paciente " + @paciente.primer_nombre + " " + @paciente.apellido_paterno + " se ha creado exitosamente."}
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: 'Paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:primer_nombre, :segundo_nombre, :apellido_paterno, :apellido_materno, :nacimiento, :dni, :direccion, :distrito, :provincia, :departamento, :email)
    end
  end
