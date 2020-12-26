class User < ApplicationRecord
  has_many :critics, dependent: :destroy
end
