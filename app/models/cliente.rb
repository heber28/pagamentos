class Cliente < ActiveRecord::Base
  attr_accessible :nome, :endereco, :telefone, :celular
end
