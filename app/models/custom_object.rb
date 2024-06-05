class CustomObject < ApplicationRecord
    has_many :custom_fields, dependent: :destroy
    has_many :custom_records, dependent: :destroy
  end
  