class AddFieldHiddenToMark < ActiveRecord::Migration
  def change
    add_column :marks, :hidden, :integer
  end
end
