class AddClientToService < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :client, null: false, foreign_key: true
  end
end
