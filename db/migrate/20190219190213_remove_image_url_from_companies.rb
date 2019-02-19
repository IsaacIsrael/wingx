class RemoveImageUrlFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :image_url, :string
  end
end
