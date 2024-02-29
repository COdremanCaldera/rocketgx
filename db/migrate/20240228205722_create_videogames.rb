class CreateVideogames < ActiveRecord::Migration[7.1]
  def change
    create_table :videogames do |t|
      t.string :title
      t.float :rating
      t.string :condition
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
