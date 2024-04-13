class Document < ApplicationRecord
  has_one_attached :file
  belongs_to :uploader, class_name: :User

  # @todo
  # Future
  # Validations for file size and file type
end
