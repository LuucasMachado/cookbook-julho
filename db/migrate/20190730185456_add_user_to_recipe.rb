class AddUserToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :user, :string
    add_column :recipes, :references, :string
  end
end
