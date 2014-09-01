class FiledsImageHome < ActiveRecord::Migration
  def change
    add_attachment :image_homes, :image
    add_attachment :image_homes, :second_image
  end
end
