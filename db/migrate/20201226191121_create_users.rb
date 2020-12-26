class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.date :birth_date
      t.string :first_name
      t.string :last_name
      t.integer :critics_count

      t.timestamps
    end
  end
end
