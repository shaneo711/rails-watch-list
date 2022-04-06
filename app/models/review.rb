class Review < ApplicationRecord
  belongs_to :list
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: (0..5).to_a
end
