class CreateCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.float :percentage_profit
      t.float :profit_amount

      t.timestamps
    end
  end
end
