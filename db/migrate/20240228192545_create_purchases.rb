class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.float :price
      t.references :users, null: false, foreign_key: true
      t.references :videogames, null: false, foreign_key: true

      t.timestamps
    end
  end
end
