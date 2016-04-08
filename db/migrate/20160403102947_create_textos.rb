class CreateTextos < ActiveRecord::Migration
  def change
    create_table :textos do |t|
      t.string :description
      t.attachment :image
      t.attachment :second_image

      t.timestamps
    end
  end
end
