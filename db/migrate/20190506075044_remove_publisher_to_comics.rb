class RemovePublisherToComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :publisher, :string
  end
end
