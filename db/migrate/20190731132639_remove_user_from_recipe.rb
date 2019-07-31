class RemoveUserFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :user, :string
    remove_column :recipes, :references, :string
  end
end
