class CreateImageHomes < ActiveRecord::Migration
  def change
    create_table :image_homes do |t|
      
      t.timestamps
    end
  end
end
