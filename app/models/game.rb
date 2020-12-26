class Game < ApplicationRecord
  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :platforms

  # optional self join
  has_many :expansions, class_name: 'Game',
                        foreign_key: 'parent_id',
                        dependent: :nullify,
                        inverse_of: :parent
  belongs_to :parent, class_name: 'Game', optional: true
end
