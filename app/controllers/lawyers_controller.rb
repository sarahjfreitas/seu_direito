#controller para o crud de advogados
class LawyersController < ApplicationController
  before_action :set_lawyer, only: [:show, :edit, :update, :destroy]

  # GET /lawyers
  #
  # - @lawyers = lista todos os adogados
  # - @titulo = titulo padrao de index - ver config/locales/messages.pt-BR.yml
  def index
    @lawyers = Lawyer.all
    @titulo = t('messages.listing', model: @lawyers.model_name.human(count: 2) )
  end

  # GET /lawyers/1
  def show
  end

  # GET /lawyers/new
  # - @lawyer = novo advogado vazio
  # - @titulo = titulo padrao de new - ver config/locales/messages.pt-BR.yml
  def new
    @lawyer = Lawyer.new
    @titulo = t('messages.new', model: @lawyer.model_name.human )
  end

  # GET /lawyers/1/edit
  # - @lawyer = busca um advogado pelo id recebido em params[:id]
  # - @titulo = titulo padrao de new - ver config/locales/messages.pt-BR.yml
  def edit
    @titulo = t('messages.edit', model: @lawyer.model_name.human )
  end

  # POST /lawyers
  #
  # Cria e salva um novo adovgado de acordo com os parametros recebidos
  # - Parametros aceitos: :name, :cpf 
  # - Redireciona para edição quando salvo com sucesso
  # - renderiza :edit em caso de falha
  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      redirect_to(@lawyer, notice: t('messages.update_success', model: @lawyer.model_name.human, genero: 'o' ))
    else
      render(:new)
    end
  end

  # PATCH/PUT /lawyers/1
  #
  # Busca um advogado pelo id recebido em params[:id]
  #
  # Faz update no adovgado buscado de acordo com os parametros recebidos
  # - Parametros aceitos: :name, :cpf 
  # - Redireciona para edição quando salvo com sucesso
  # - renderiza :edit em caso de falha
  def update
    if @lawyer.update(lawyer_params)
      redirect_to(@lawyer, notice: t('messages.update_success', model: @lawyer.model_name.human, genero: 'o' ))
    else
      render(:edit)
    end
  end

  # DELETE /lawyers/1
  #
  # Busca um advogado pelo id recebido em params[:id]
  #
  # Tenta apagar o registro buscado
  #
  # Redireciona para lawyers_path e retorna mensagem de sucesso ou erro
  def destroy
    begin
      @lawyer.destroy
      redirect_to(lawyers_path, notice: t('messages.destroy_success', model: @lawyer.model_name.human, genero: 'o' ))
    rescue 
      redirect_to(lawyers_path, alert: t('messages.destroy_fail'))
    end
  end

  private
    # @lawyer = Busca um advogado pelo id recebido em params[:id]
    def set_lawyer
      @lawyer = Lawyer.find(params[:id])
    end

    # Gera hash com os parametros permitidos: :name, :cpf
    def lawyer_params
      params.fetch(:lawyer).permit(:name,:cpf)
    end
end
