class RemoveEmailFromClients < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :email, :string
    remove_reference :clients, :admin, null: false, foreign_key: true
  end
end
