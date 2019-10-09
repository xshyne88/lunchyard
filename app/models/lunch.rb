class Lunch < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  has_many :lunch_dishes, dependent: :destroy
  has_many :dishes, through: :lunch_dishes, dependent: :destroy

  default_scope { order('date') }
  scope :upcoming, -> { where("date::date > now()") }
end
