class Municipality < ApplicationRecord
  belongs_to :state
  has_many :zip_codes, dependent: :destroy
end
