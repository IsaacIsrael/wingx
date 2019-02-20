class AddPhotoToFlight < ActiveRecord::Migration[5.2]
  def change
        add_column :flights, :photo, :string
  end
end
