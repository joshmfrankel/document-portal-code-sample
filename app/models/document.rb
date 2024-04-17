class Document < ApplicationRecord
  has_one_attached :file
  belongs_to :uploader, class_name: :User

  validates :file, presence: true
end
