# frozen_string_literal: true

class ZipCode < ApplicationRecord
  belongs_to :municipality
  has_many :restaurants, dependent: :destroy
end
