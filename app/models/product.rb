class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, as: :reviewable, dependent: :destroy
  extend FriendlyId
  friendly_id :title, use: :slugged


  def calculate_average
    x = 0
    z = self.reviews.size
    self.reviews.each do |rev|
     x += rev.total_rate
     end
     y = (x / z).to_f
     #self.update_column(:average_rate, 0)
     self.update_attribute(:average_rate, y)
     #self.save!
 end
end
