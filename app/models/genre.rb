class Genre < ApplicationRecord
  validates :name, presence: true

  has_many :items
  validates :name, presence: true, uniqueness: true
  # validates :status, presence: true, uniqueness: true

end
