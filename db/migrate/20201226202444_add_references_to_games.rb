class AddReferencesToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :parent, null: true, foreign_key: { to_table: :games }
  end
end
