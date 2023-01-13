class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, as: :reviewable, dependent: :destroy
  extend FriendlyId
  friendly_id :title, use: :slugged


  def calculate_average
    x = 0.0
    z = self.reviews.size
    self.reviews.each do |rev|
     x += rev.total_rate.to_f
     end
     y = (x / z).to_f
     #self.update_column(:average_rate, 0)
     self.update_attribute(:average_rate, y)
     #self.save!
 end

 def calculate_metrics
  x = 0
  y = 0
  z = 0
  self.reviews.each do |r|
      x += r.review_responses.first.rate unless r.review_responses.first.nil?
      y += r.review_responses.second.rate unless r.review_responses.second.nil?
      z += r.review_responses.third.rate unless r.review_responses.third.nil?
      q += r.review_responses.fourth.rate unless r.review_responses.fourth.nil?      
    end
  
end


end
