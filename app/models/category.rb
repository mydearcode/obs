class Category < ApplicationRecord
    validates_presence_of :title
    has_many :metrics
    accepts_nested_attributes_for :metrics
    extend FriendlyId
    friendly_id :title, use: :slugged
end
