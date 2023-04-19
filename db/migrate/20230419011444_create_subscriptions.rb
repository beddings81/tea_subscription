class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title, null: false
      t.float :price, null: false
      t.integer :status, null: false
      t.integer :frequency, null: false
    end
  end
end
