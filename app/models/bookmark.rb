class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # Validates the presence of a movie and a list for the bookmark
  validates :movie_id, presence: true
  validates :list_id, presence: true

  # Ensures [movie, list] pairings are unique
  validates :movie_id, uniqueness: { scope: :list_id }
end
