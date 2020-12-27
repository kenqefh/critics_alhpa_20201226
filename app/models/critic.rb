class Critic < ApplicationRecord
  belongs_to :user

  belongs_to :criticable, polymorphic: true
end
