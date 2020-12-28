class InvolvedCompany < ApplicationRecord
  belongs_to :company
  belongs_to :game

  # Validations
  validates :developer, :publisher, presence: true
  validates :company_id, uniqueness: { scope: :game_id }
end
