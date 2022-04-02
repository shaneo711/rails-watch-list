class List < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :bookmarks, :movies
end
