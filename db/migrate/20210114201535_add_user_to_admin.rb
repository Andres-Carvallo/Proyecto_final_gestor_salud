class AddUserToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_reference :admins, :user, foreign_key: true
  end
end
