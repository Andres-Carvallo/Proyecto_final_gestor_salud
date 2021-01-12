class RemoveServicePriceFromClient < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :service_price, :integer
  end
end
