class Critic < ApplicationRecord
  # association belongs to, and count how many critics has a user.
  belongs_to :user, counter_cache: true
  # belongs_to :user, counter_cache: :critics_count

  belongs_to :criticable, polymorphic: true

  #  # Update critics count
  #  after_create :critics_count_plus_one
  #  after_destroy :critics_count_less_one
  #
  #  private
  #
  #  def critics_count_plus_one
  #    update_critics_count(1)
  #  end
  #
  #  def critics_count_less_one
  #    update_critics_count(-1)
  #  end
  #
  #  def update_critics_count(num)
  #    user.critics_count += num
  #  end
end
