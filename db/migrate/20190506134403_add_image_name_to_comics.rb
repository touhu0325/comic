class AddImageNameToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :image_name, :string 
  end
end
