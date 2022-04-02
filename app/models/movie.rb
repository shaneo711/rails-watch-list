class Movie < ApplicationRecord
  belongs_to :list
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, :overview, presence: true
end
