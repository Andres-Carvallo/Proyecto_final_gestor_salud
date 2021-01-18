class AddScoreToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :score, :integer
  end
end
