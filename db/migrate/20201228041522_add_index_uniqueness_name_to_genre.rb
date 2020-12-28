class AddIndexUniquenessNameToGenre < ActiveRecord::Migration[6.0]
  def change
    add_index :genres, :name, unique: true
  end
end
