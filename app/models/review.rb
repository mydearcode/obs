class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :parent, class_name: 'Review', optional: true
  has_many :review_responses, dependent: :destroy
  accepts_nested_attributes_for :review_responses
  has_many :proofs, dependent: :destroy
  accepts_nested_attributes_for :proofs
  has_many :photo_proofs, dependent: :destroy
  accepts_nested_attributes_for :photo_proofs
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  
  after_save :calculate_total_amount


  def calculate_total_amount
    x = 0.0
    z = self.review_responses.size
   self.review_responses.each do |res|
    x += res.rate.to_f
    end
    y = (x / z).to_f
    self.update_column(:total_rate, y)

end





end
