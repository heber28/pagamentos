class Pagamento < ActiveRecord::Base
  attr_accessible :data, :valor
  default_scope :order => 'data'
  belongs_to :cliente
  validates :data, :valor, :presence => true
end
