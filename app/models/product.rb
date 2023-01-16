class Product < ApplicationRecord
  belongs_to :brand
  has_many :reviews, as: :reviewable, dependent: :destroy
  #has_many :comments, as: :commentable, dependent: :destroy

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
  rate_1 = 0
  rate_2 = 0
  rate_3 = 0
  rate_4 = 0
  metric_1 = Category.find_by(id: self.category_id).metrics.first.title unless Category.find_by(id: self.category_id).metrics.first.nil?
  metric_2 = Category.find_by(id: self.category_id).metrics.second.title unless Category.find_by(id: self.category_id).metrics.second.nil?
  metric_3 = Category.find_by(id: self.category_id).metrics.third.title unless Category.find_by(id: self.category_id).metrics.third.nil?
  metric_5 = Category.find_by(id: self.category_id).metrics.fourth.title unless Category.find_by(id: self.category_id).metrics.fourth.nil?
  self.reviews.each do |r|
      rate_1 += r.review_responses.first.rate.to_f unless r.review_responses.first.nil?
      rate_2 += r.review_responses.second.rate.to_f unless r.review_responses.second.nil?
      rate_3 += r.review_responses.third.rate.to_f unless r.review_responses.third.nil?
      rate_4 += r.review_responses.fourth.rate.to_f unless r.review_responses.fourth.nil?      
    end
    average = self.reviews.size
    rate_1 = (rate_1 / average).to_f
    rate_2 = (rate_2 / average).to_f
    rate_3 = (rate_3 / average).to_f
    rate_4 = (rate_4 / average).to_f
    self.update(rate_1: rate_1, rate_2: rate_2, rate_3: rate_3, rate_4: rate_4, metric_1: metric_1, metric_2: metric_2, metric_3: metric_3, metric_4: metric_4 )
end


end
