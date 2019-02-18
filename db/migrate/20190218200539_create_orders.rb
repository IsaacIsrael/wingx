class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :passenger_number
      t.references :flight, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
