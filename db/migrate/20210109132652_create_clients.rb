class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.integer :rut
      t.integer :service_price
      t.integer :paid_out

      t.timestamps
    end
  end
end
