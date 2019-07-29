class List < ApplicationRecord
    has_many :recipes_list
    has_many :recipes, through: :recipes_list
end
