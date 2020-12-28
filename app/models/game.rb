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

  # polymorphic
  has_many :critics, as: :criticable, dependent: :destroy

  # Enums
  enum category: {
    main_game: 0,
    expansion: 1
  }

  # validations
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validates :rating, allow_nil: true,
                     numericality: true,
                     inclusion: { in: 0..100, message: 'Should be between 0 and 100' }
  validate :parent_id_validation

  private

  def parent_id_validation
    errors.add(:parent_id, "Main game doesn't have a parent_id") if main_game? && !parent_id.nil?

    return unless expansion? && (parent_id.nil? || Game.exists?(parent_id))

    errors.add(:parent_id, 'Parent id needs to be valid')
  end
end
