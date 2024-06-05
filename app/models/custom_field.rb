class CustomField < ApplicationRecord
  belongs_to :custom_object

  validates :name, presence: true
  validates :field_type, presence: true
end
