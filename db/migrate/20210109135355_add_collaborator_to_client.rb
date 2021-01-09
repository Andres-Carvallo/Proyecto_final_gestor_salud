class AddCollaboratorToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :collaborator, null: false, foreign_key: true
  end
end
