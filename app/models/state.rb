class State < ApplicationRecord
    has_many :municipalities, dependent: :destroy
end
