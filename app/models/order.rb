class Order < ApplicationRecord
  # validate :
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :product
end
