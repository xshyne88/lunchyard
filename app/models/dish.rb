class Dish < ApplicationRecord
  belongs_to :vendor
  has_many :lunch_dishes, dependent: :destroy
  has_many :lunches, through: :lunch_dishes, dependent: :destroy
end
