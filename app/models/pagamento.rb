class Pagamento < ActiveRecord::Base
  attr_accessible :data, :valor, :total
  belongs_to :cliente
  belongs_to :user
  validates :data, :valor, :presence => true

  def self.total(user_id, cliente_id, data)
    start_date = Time.utc(data.year, data.month, 1, 0, 0, 0, 0)
    end_date = Time.utc(data.year, data.month, data.end_of_month.day, 23, 59, 59, 999999)
    Pagamento.where(:user_id => user_id, :cliente_id => cliente_id, :data => (start_date..end_date)).sum(:valor)
  end  

  def self.dia(user_id, data)
    start_date = Time.utc(data.year, data.month, data.day, 0, 0, 0, 0) - 1.minute;
    end_date = Time.utc(data.year, data.month, data.day, 23, 59, 59, 999999);
    Pagamento.where(:user_id => user_id, :data => (start_date..end_date))
  end

end
