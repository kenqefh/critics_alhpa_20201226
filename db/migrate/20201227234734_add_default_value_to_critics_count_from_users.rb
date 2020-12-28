class AddDefaultValueToCriticsCountFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :critics_count, from: nil, to: 0
  end
end
