# Model pai para todos os tipos de pessoas do sistema. 
#
# Obs: usada apenas para herança
#
# Tabela: people
#
# Atributos:
# - id :bigint :primary_key
# - name :string
# - cpf :string
# - type :string - nome da classe filha vinculada
#
# Validação:
# - name - obrigatorio
# - type - obrigatorio

class Person < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true
end
