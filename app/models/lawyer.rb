# Model para a tabela de advogados
#
# Veja os atributos e tabela de origem na classe Person
#
# Validação:
# - cpf - obrigatorio
class Lawyer < Person
  validates :cpf, presence: true
end
