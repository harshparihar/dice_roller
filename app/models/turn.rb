class Turn < ApplicationRecord
  has_many :rolls, dependent: :destroy
  belongs_to :user
end
