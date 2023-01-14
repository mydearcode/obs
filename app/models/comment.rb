class Comment < ApplicationRecord
  belongs_to :commentable,  polymorphic: true
  belongs_to :parent, class_name: 'Comment', optional: true
end
