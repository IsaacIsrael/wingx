class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.references :feature, foreign_key: true
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
