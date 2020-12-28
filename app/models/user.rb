class User < ApplicationRecord
  has_many :critics, dependent: :destroy

  # validations
  validates :username, :email, presence: true, uniqueness: true
  validates :email, email: true
  validate :birth_date_validate

  private

  def birth_date_validate
    return unless birth_date > 16.years.ago

    errors.add(:birth_date, 'You should be 16 years old to create an account')
  end
end
