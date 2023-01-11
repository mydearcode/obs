class Category < ApplicationRecord
    validates_presence_of :title
    has_many :metrics
    accepts_nested_attributes_for :metrics
end
