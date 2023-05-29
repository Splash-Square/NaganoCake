class Genre < ApplicationRecord
  has_many :items

  validates :item_genre, presence: true

end
