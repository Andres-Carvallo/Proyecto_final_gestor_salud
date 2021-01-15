class AddUserToCollaborator < ActiveRecord::Migration[6.0]
  def change
    add_reference :collaborators, :user, foreign_key: true
  end
end
