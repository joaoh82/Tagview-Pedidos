class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.string :referencia
      t.integer :qtde
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
