class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :brew_time, null: false
    end
  end
end
