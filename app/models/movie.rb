class Movie < ApplicationRecord
  before_destroy :check_for_bookmarks
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
end


private

def check_for_bookmarks
  if bookmarks.any?
    errors.add(:base, 'Cannot delete movie with bookmarks')
    throw(:abort)
  end
end
