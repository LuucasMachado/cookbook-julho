class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
