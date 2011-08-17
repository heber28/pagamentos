class Cliente < ActiveRecord::Base
  has_many :pagamentos
  belongs_to :user
  default_scope :order => 'nome'
  validates :nome, :presence => true
  attr_accessible :nome, :endereco, :telefone, :celular

  def self.search(search, user_id)
    if search
      find(:all, :conditions => ['user_id = ? and nome LIKE ?', user_id, "%#{search}%"])
    else
      find(:all, :conditions => ['user_id = ?', user_id])
    end
  end
end
