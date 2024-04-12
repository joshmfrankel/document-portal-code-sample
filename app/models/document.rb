class Document < ApplicationRecord
  has_one_attached :file

  # @todo
  # Future
  # Validations for file size and file type
end
