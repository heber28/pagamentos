class Cliente < ActiveRecord::Base
  has_many :pagamentos
  default_scope :order => 'nome'
  validates :nome, :presence => true
  attr_accessible :nome, :endereco, :telefone, :celular
end
