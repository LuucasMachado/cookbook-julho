class Recipe < ApplicationRecord
  belongs_to :recipe_type 
  belongs_to :cuisine
  has_many: recipes_list
  has_many: list, through: recipes_list
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time,
             :ingredients, :cook_method, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
