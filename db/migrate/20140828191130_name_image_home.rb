class NameImageHome < ActiveRecord::Migration
  def change
    add_column :image_homes, :name, :string
  end
end
