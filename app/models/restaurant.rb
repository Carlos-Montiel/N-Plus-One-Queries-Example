# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :owner
  belongs_to :zip_code
end
