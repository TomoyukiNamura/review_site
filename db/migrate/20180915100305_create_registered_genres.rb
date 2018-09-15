class CreateRegisteredGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :registered_genres do |t|

      t.timestamps
    end
  end
end
