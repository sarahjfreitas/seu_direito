class LawyersController < ApplicationController
  before_action :set_lawyer, only: [:show, :edit, :update, :destroy]

  # GET /lawyers
  # GET /lawyers.json
  def index
    @lawyers = Lawyer.all
  end

  # GET /lawyers/1
  # GET /lawyers/1.json
  def show
  end

  # GET /lawyers/new
  def new
    @lawyer = Lawyer.new
  end

  # GET /lawyers/1/edit
  def edit
  end

  # POST /lawyers
  # POST /lawyers.json
  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      redirect_to(@lawyer, notice: 'Advogado cadastrado com sucesso.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /lawyers/1
  # PATCH/PUT /lawyers/1.json
  def update
    if @lawyer.update(lawyer_params)
      redirect_to(@lawyer, notice: 'Advogado atualizado com sucesso.')
    else
      render(:edit)
    end
  end

  # DELETE /lawyers/1
  # DELETE /lawyers/1.json
  def destroy
    begin
      @lawyer.destroy
      redirect_to(lawyers_path, notice: 'Advogado excluído com sucesso.')
    rescue 
      redirect_to(lawyers_path, notice: 'Não foi possível excluir.')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawyer
      @lawyer = Lawyer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawyer_params
      params.fetch(:lawyer).permit(:name,:cpf)
    end
end
