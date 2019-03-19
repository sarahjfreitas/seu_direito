class LawyersController < ApplicationController
  before_action :set_lawyer, only: [:show, :edit, :update, :destroy]

  # GET /lawyers
  # GET /lawyers.json
  def index
    @lawyers = Lawyer.all
    @titulo = t('messages.listing', model: @lawyers.model_name.human(count: 2) )
  end

  # GET /lawyers/1
  # GET /lawyers/1.json
  def show
  end

  # GET /lawyers/new
  def new
    @lawyer = Lawyer.new
    @titulo = t('messages.new', model: @lawyer.model_name.human )
  end

  # GET /lawyers/1/edit
  def edit
    @titulo = t('messages.edit', model: @lawyer.model_name.human )
  end

  # POST /lawyers
  # POST /lawyers.json
  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      redirect_to(@lawyer, notice: t('messages.update_success', model: @lawyer.model_name.human, genero: 'o' ))
    else
      render(:new)
    end
  end

  # PATCH/PUT /lawyers/1
  # PATCH/PUT /lawyers/1.json
  def update
    if @lawyer.update(lawyer_params)
      redirect_to(@lawyer, notice: t('messages.update_success', model: @lawyer.model_name.human, genero: 'o' ))
    else
      render(:edit)
    end
  end

  # DELETE /lawyers/1
  # DELETE /lawyers/1.json
  def destroy
    begin
      @lawyer.destroy
      redirect_to(lawyers_path, notice: t('messages.destroy_success', model: @lawyer.model_name.human, genero: 'o' ))
    rescue 
      redirect_to(lawyers_path, notice: t('messages.destroy_fail'))
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
