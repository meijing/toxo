class AddFieldTexto < ActiveRecord::Migration
  def change
    add_column :textos, :name, :string
  end
end
