class Vendor < ApplicationRecord
  has_many :lunches
  has_many :dishes, dependent: :destroy
end
