class RemoveImageYrlFromUserImages < ActiveRecord::Migration[6.0]
  def change

    remove_column :user_images, :image_yrl, :string
  end
end
