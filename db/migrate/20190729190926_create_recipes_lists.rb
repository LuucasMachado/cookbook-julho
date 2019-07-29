class CreateRecipesLists < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes_lists do |t|
      t.references :list, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
