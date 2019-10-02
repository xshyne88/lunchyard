class Lunch < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  has_many :dishes, through: :lunch_dishes
end
