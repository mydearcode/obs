class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, as: :reviewable, dependent: :destroy
  extend FriendlyId
  friendly_id :title, use: :slugged





#   def calculate_total_amount
#     self.review_responses.each do |res|
#      self.total_rate += res.rate
#      end
#      y = (self.total_rate / self.review_responses.size).to_f
#      self.update_column(:total_rate, y)
#  end
end
