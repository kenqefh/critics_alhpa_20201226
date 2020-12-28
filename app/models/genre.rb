class Genre < ApplicationRecord
  has_and_belongs_to_many :games

  # validations
  validates :name, presence: true, uniqueness: true
end
