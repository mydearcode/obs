class Review < ApplicationRecord
  belongs_to :product
  belongs_to :reviewable, polymorphic: true
  belongs_to :parent, class_name: 'Review', optional: true
  



end
