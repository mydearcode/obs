class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :parent, class_name: 'Review', optional: true
  has_many :review_responses, dependent: :destroy
  accepts_nested_attributes_for :review_responses




end
