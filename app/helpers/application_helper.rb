module ApplicationHelper
  def botao_salvar
    ('<div class="pull-right"><button type="submit" class="btn btn-primary"><span class="fa fa-save"></span> '+t('messages.save') +'</button></div>').html_safe
  end

  def botao_voltar(link)
    link_to('<i class="fa fa-arrow-left"></i> '.html_safe + t('messages.back'), link, class: "btn btn-xs btn-default")
  end
end
