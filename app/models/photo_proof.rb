class PhotoProof < ApplicationRecord
  belongs_to :review
  include ImageUploader::Attachment(:image)
end
