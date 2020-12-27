class AddCriticableToCritics < ActiveRecord::Migration[6.0]
  def change
    add_reference :critics, :criticable, polymorphic: true, null: false
  end
end
