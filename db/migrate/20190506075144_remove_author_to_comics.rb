class RemoveAuthorToComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :author, :string 
  end
end
