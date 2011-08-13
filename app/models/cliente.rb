class Cliente < ActiveRecord::Base
  has_many :pagamentos
  default_scope :order => 'nome'
  validates :nome, :presence => true
  attr_accessible :nome, :endereco, :telefone, :celular

  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
