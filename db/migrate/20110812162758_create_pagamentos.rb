class CreatePagamentos < ActiveRecord::Migration
  def self.up
    create_table :pagamentos do |t|
      t.date :data
      t.decimal :valor, :precision => 8, :scale => 2
      t.integer :cliente_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pagamentos
  end
end
