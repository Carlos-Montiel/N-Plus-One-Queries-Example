# frozen_string_literal: true

class State < ApplicationRecord
  has_many :municipalities, dependent: :destroy
end
