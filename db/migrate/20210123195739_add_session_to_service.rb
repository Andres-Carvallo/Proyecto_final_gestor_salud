class AddSessionToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :session, :integer
    add_column :services, :bill, :integer
  end
end
