class Lunch < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  has_many :dishes, through: :lunch_dishes

  default_scope { order('date') }
  scope :upcoming, -> { where("date::date > now()") }
end
