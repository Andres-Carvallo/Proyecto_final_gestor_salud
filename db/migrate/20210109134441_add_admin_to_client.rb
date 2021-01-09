class AddAdminToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :admin, null: false, foreign_key: true
  end
end
