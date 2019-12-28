class AddImageUrlToUserImages < ActiveRecord::Migration[6.0]
  def change
    add_column :user_images, :image_url, :string
  end
end
