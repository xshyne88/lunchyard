class Dish < ApplicationRecord
  belongs_to :vendor
  has_many :lunches, through: :lunch_dishes
end
