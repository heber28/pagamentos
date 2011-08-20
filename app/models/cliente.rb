class Cliente < ActiveRecord::Base
  has_many :pagamentos
  belongs_to :user
  default_scope :order => 'nome'
  validates :nome, :presence => true
  attr_accessible :nome, :endereco, :telefone, :celular

  def self.search(search, user_id, page)
    if search
      paginate :per_page => 10, :page => page,
               :conditions => ['user_id = ? and nome LIKE ?', user_id, "%#{search}%"]
    else
      paginate :per_page => 10, :page => page,
               :conditions => ['user_id = ?', user_id]
    end
  end

  def self.list(user_id, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['user_id = ?', user_id]  
  end
end
