class CustomRecord < ApplicationRecord
  belongs_to :custom_object

  validates :data, presence: true
end