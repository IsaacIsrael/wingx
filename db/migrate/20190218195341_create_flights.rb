class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destiny
      t.integer :date
      t.integer :capacity
      t.float :price
      t.text :description
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
