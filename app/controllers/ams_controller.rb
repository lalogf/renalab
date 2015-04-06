class AmsController < ApplicationController
  before_action :set_am, only: [:show, :edit, :update, :destroy]
  before_action :set_paciente, only: [:new, :create, :edit, :update,:show, :index]
  before_action :authenticate_user!, except:[:index, :show] 
  # GET /ams
  # GET /ams.json
  def index
    @ams = Am.all
  end

  # GET /ams/1
  # GET /ams/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = AmPdf.new(@am)
        send_data pdf.render, filename: "Analisis_mensual_#{@am.fecha}.pdf",
                              type: "application/pdf",
                              disposition: "inline"    
      end

    end

  end

  # GET /ams/new
  def new
    @am = Am.new
  end

  # GET /ams/1/edit
  def edit
  end

  # POST /ams
  # POST /ams.json
  def create
    @am = Am.new(am_params.merge(paciente_id: params[:paciente_id]))

    respond_to do |format|
      if @am.save
        format.html { redirect_to paciente_path(params[:paciente_id]), notice: 'Nuevo análisis creado con éxito.'  }
        format.json { render :show, status: :created, location: @am }
      else
        format.html { render :new }
        format.json { render json: @am.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ams/1
  # PATCH/PUT /ams/1.json
  def update
    respond_to do |format|
      if @am.update(am_params)
        format.html { redirect_to @am, notice: 'Se creó el análisis mensual de ' + params[:fecha]  }
        format.json { render :show, status: :ok, location: @am }
      else
        format.html { render :edit }
        format.json { render json: @am.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ams/1
  # DELETE /ams/1.json
  def destroy
    @am.destroy
    respond_to do |format|
      format.html { redirect_to ams_url, notice: 'Am was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_am
      @am = Am.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def am_params
      params.require(:am).permit(:hto, :hb, :peso_pre, :peso_post, :urea_pre, :urea_post, :urr, :ktv, :tgp, :tgo, :fecha, :paciente_id)
    end

    def set_paciente
      @paciente = Paciente.find(params[:paciente_id])
    end
end
