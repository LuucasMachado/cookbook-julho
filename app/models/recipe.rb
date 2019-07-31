class Recipe < ApplicationRecord
  belongs_to :recipe_type 
  belongs_to :cuisine
  belongs_to :user
  has_one_attached :photo
  has_many :list, through: :recipes_list
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time,
             :ingredients, :cook_method, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
