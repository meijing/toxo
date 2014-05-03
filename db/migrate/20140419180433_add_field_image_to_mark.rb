class AddFieldImageToMark < ActiveRecord::Migration
  def change
    add_attachment :marks, :image
  end
end
