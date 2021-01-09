class AddAdminToCollaborator < ActiveRecord::Migration[6.0]
  def change
    add_reference :collaborators, :admin, null: false, foreign_key: true
  end
end
