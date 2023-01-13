class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, as: :reviewable, dependent: :destroy
  extend FriendlyId
  friendly_id :title, use: :slugged
end
