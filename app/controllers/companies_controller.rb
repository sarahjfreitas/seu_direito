class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    @titulo = t('messages.listing', model: @companies.model_name.human(count: 2) )
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @titulo = t('messages.new', model: @company.model_name.human )
  end

  # GET /companies/1/edit
  def edit
    @titulo = t('messages.edit', model: @company.model_name.human )
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to(@company, notice: t('messages.create_success', model: @company.model_name.human ), genero: 'a' )
    else
      render(:new)
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        redirect_to(@company, notice: t('messages.update_success', model: @company.model_name.human, genero: 'a' ) )
      else
        render(:edit)
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    begin
      @company.destroy
      redirect_to(lawyers_path, notice: t('messages.destroy_success', model: @company.model_name.human, genero: 'a' ))
    rescue 
      redirect_to(lawyers_path, notice: t('messages.destroy_fail') )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
