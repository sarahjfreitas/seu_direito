class Lawyer < Person
  validates :cpf, presence: true
end
