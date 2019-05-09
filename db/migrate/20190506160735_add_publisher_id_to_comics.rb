class AddPublisherIdToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :publisher_id, :integer
  end
end
