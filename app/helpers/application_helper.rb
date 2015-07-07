module ApplicationHelper
  def status_helper(status)
    if status
      "<span class='label label-success'>Ativo</span>".html_safe 
    else
      "<span class='label label-default'>Inativo</span>".html_safe
    end
  end

  def candidate_helper(status)
    case status
    when 'verify'
      "Em análise"
    when 'success'
      "Homologado"
    when 'error'
      "Não homologado"
    when 'waiting'
      "Aguardando pagamento" 
    end
  end
end
