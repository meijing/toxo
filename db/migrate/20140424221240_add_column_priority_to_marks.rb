class AddColumnPriorityToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :priority, :integer
  end
end
