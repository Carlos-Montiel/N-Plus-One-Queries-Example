# frozen_string_literal: true

class Owner < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
