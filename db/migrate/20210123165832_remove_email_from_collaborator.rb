class RemoveEmailFromCollaborator < ActiveRecord::Migration[6.0]
  def change
    remove_column :collaborators, :email, :string
  end
end
